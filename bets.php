<!DOCTYPE html>
<!-- BeaverBets Place Bet Page -->
<html>
<head>
    <title>BeaverBets - Place a Bet</title>
    <link rel="stylesheet" href="bets.css">
</head>
<body>

<?php
session_start();

define('DB_SERVER', 'classmysql.engr.oregonstate.edu');
define('DB_USERNAME', 'cs340_frugial');
define('DB_PASSWORD', '1303');
define('DB_NAME', 'cs340_frugial');

$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];

    // Fetch user information
    $user_query = "SELECT user_name, balance FROM USER WHERE user_id = '$user_id'";
    $user_result = mysqli_query($link, $user_query);

    if (mysqli_num_rows($user_result) > 0) {
        $user_row = mysqli_fetch_assoc($user_result);
        $user_name = $user_row['user_name'];
        $balance = $user_row['balance'];

        // Fetch upcoming games with odds
        $games_query = "SELECT G.game_id, G.game_date, HT.city AS home_team, AT.city AS away_team, O.home_win_odds, O.away_win_odds 
                        FROM GAME G
                        JOIN TEAM HT ON G.home_team_id = HT.team_id
                        JOIN TEAM AT ON G.away_team_id = AT.team_id
                        JOIN ODDS O ON G.game_id = O.odds_id
                        WHERE G.game_date > CURDATE()";
                        
        $games_result = mysqli_query($link, $games_query);
    } else {
        $error = "User not found.";
    }
} else {
    $error = "You need to log in first.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['bet'])) {
    $game_id = mysqli_real_escape_string($link, $_POST['game_id']);
    $bet_type = mysqli_real_escape_string($link, $_POST['bet_type']);
    $bet_amount = mysqli_real_escape_string($link, $_POST['bet_amount']);
    $bet_date = date('Y-m-d');

    // Fetch odds for the selected game
    $odds_sql = "SELECT home_win_odds, away_win_odds FROM ODDS WHERE odds_id = '$game_id'";
    $odds_result = mysqli_query($link, $odds_sql);
    $odds_row = mysqli_fetch_assoc($odds_result);

    $payout = ($bet_type == 'home_win') ? $bet_amount * $odds_row['home_win_odds'] : $bet_amount * $odds_row['away_win_odds'];

    // Insert bet into BETS_ON table
    $insert_sql = "INSERT INTO BETS_ON (bet_type, bet_date, bet_amount, payout, user_id, odds_id) 
                   VALUES ('$bet_type', '$bet_date', '$bet_amount', '$payout', '$user_id', '$game_id')";

    if (mysqli_query($link, $insert_sql)) {
        echo "Bet placed successfully!";
    } else {
        echo "ERROR: Could not place bet. " . mysqli_error($link);
    }
}

mysqli_close($link);
?>

<div class="container">
    <div class="content">
        <img src="benny.webp" alt="BeaverBets Logo" class="logo">
        <div class="user-info">
            <?php if (isset($error)) { echo "<p class='error'>$error</p>"; } else { ?>
                <h1>Welcome, <?php echo htmlspecialchars($user_name); ?>!</h1>
                <p>Your current balance is: $<?php echo htmlspecialchars(number_format($balance, 2)); ?></p>
            <?php } ?>
        </div>
    </div>

    <div class="bets">
        <h2>Upcoming Games</h2>
        <?php if (isset($games_result) && mysqli_num_rows($games_result) > 0) { ?>
        <table border="1">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Home Team</th>
                    <th>Away Team</th>
                    <th>Home Win Odds</th>
                    <th>Away Win Odds</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php while($row = mysqli_fetch_assoc($games_result)) { ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['game_date']); ?></td>
                    <td><?php echo htmlspecialchars($row['home_team']); ?></td>
                    <td><?php echo htmlspecialchars($row['away_team']); ?></td>
                    <td><?php echo htmlspecialchars($row['home_win_odds']); ?></td>
                    <td><?php echo htmlspecialchars($row['away_win_odds']); ?></td>
                    <td>
                        <form method="POST" action="">
                            <input type="hidden" name="game_id" value="<?php echo $row['game_id']; ?>">
                            <select name="bet_type">
                                <option value="home_win">Home Win</option>
                                <option value="away_win">Away Win</option>
                            </select>
                            <input type="number" name="bet_amount" placeholder="Bet Amount" required>
                            <input type="submit" name="bet" value="Place Bet">
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
        <?php } else { ?>
        <p>No upcoming games available.</p>
        <?php } ?>
    </div>
</div>

</body>
</html>
