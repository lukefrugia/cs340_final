<!DOCTYPE html>
<!-- BeaverBets User Dashboard -->
<html>
<head>
    <title>BeaverBets Dashboard</title>
    <link rel="stylesheet" href="user.css">
</head>
<body>

<?php
session_start();

define('DB_SERVER', 'classmysql.engr.oregonstate.edu');
define('DB_USERNAME', 'cs340_frugial');
define('DB_PASSWORD', '1303');
define('DB_NAME', 'cs340_frugial');

$url; 
$redirect_url = "user.php?username={$_GET['username']}";
$upcoming_user_bets = array();
$past_user_bets = array();

$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

if (isset($_GET['username'])) {
  $username = mysqli_real_escape_string($link, $_GET['username']);

  $query = "SELECT user_id, user_name, balance FROM USER WHERE user_name = '$username'";
  $result = mysqli_query($link, $query);

  if (mysqli_num_rows($result) > 0) {
      $row = mysqli_fetch_assoc($result);
      $user_id = $row['user_id'];
      $user_name = $row['user_name'];
      $balance = $row['balance'];

      $url = "bets.php?user_id=" . urlencode($user_id);

      // Fetch user bets
      $upcoming_bets_query = "SELECT bet_id, bet_type, bet_date, bet_amount, payout, odds_id, B.game_id
                              FROM BETS_ON B
                              JOIN GAME G ON B.game_id = G.game_id
                              WHERE user_id = '{$user_id}'
                              AND G.winning_team_id IS NULL";

        $past_bets_query = "SELECT bet_id, bet_type, bet_date, bet_amount, payout, odds_id, B.game_id, G.winning_team_id, home_team_id, away_team_id
                            FROM BETS_ON B
                            JOIN GAME G ON B.game_id = G.game_id
                            WHERE user_id = '{$user_id}'
                            AND G.winning_team_id IS NOT NULL";

      $bets_result = mysqli_query($link, $upcoming_bets_query);
      if (mysqli_num_rows($bets_result) > 0) {
          while ($bet = mysqli_fetch_assoc($bets_result)) {
              $upcoming_user_bets[] = $bet;
          }
      }

      $bets_result = mysqli_query($link, $past_bets_query);
      if (mysqli_num_rows($bets_result) > 0) {
          while ($bet = mysqli_fetch_assoc($bets_result)) {
              $past_user_bets[] = $bet;
          }
      }
  } else {
      $error = "User not found.";
  }
} else {
  $error = "No username provided.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['double-down'])) {
    $bet_id = $_POST['bet_id'];

    $user_query = " SELECT U.balance, B.bet_amount
                    FROM USER U
                    JOIN BETS_ON B ON U.user_id = B.user_id
                    WHERE U.user_name = '{$_GET['username']}' AND B.bet_id = $bet_id";

    $result = mysqli_query($link, $user_query);
    $result = mysqli_fetch_assoc($result);
    $balance = $result['balance'];
    $bet_amount = $result['bet_amount'];

    if ($balance - $bet_amount < 0){
        echo "You do not have enough money to double down.";
    }
    else{
        $update_bet_query = "UPDATE BETS_ON B
                     JOIN ODDS O ON B.odds_id = O.odds_id
                     SET B.bet_amount = B.bet_amount * 2,
                         B.payout = CASE B.bet_type
                                    WHEN 'home_win' THEN (B.bet_amount * 2) * O.home_win_odds
                                    WHEN 'away_win' THEN (B.bet_amount * 2) * O.away_win_odds
                                    END
                     WHERE bet_id = {$bet_id}";

        $update_balance_query = "UPDATE USER
                                 SET balance = balance - $bet_amount
                                 WHERE user_name = '{$_GET['username']}'";

        $correct_error_query = "UPDATE USER
                                SET balance = balance + $bet_amount
                                WHERE user_name = '{$_GET['username']}'";

        if (!mysqli_query($link, $update_balance_query)){
            echo "ERROR: Could not update balance. " . mysqli_error($link);
            exit();
        }

        if (!mysqli_query($link, $update_bet_query)){
            echo "ERROR: Could not place bet. " . mysqli_error($link);

            while (!mysqli_query($link, $correct_error_query)) {}
            exit();
        }

        header("Location: $redirect_url");
        exit();
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['simulate'])) {
    $odds_id = $_POST['odds_id'];
    $game_id = $_POST['game_id'];

    $odds_query = " SELECT home_win_odds, away_win_odds
                    FROM ODDS
                    WHERE odds_id = {$odds_id};";

    $result = mysqli_query($link, $odds_query);
    $odds = mysqli_fetch_assoc($result);

    $teams_query = "SELECT home_team_id, away_team_id
                    FROM GAME
                    WHERE game_id = {$game_id};";

    $result = mysqli_query($link, $teams_query);
    $teams = mysqli_fetch_assoc($result);

    $home_win_prob = ceil(( 1.0 / $odds['home_win_odds'] ) * 100.0);
    $away_win_prob = ceil(( 1.0 / $odds['away_win_odds'] ) * 100.0);

    $range = $home_win_prob + $away_win_prob;
    $randnum = rand(1, $range);

    $winner_id;
    if ($randnum <= $home_win_prob)
        $winner_id = $teams['home_team_id'];
    else
        $winner_id = $teams['away_team_id'];

    $update_query = "UPDATE GAME
                     SET winning_team_id = {$winner_id}
                     WHERE game_id = {$game_id};";

    // echo $update_query;
    // exit();

    if (!mysqli_query($link, $update_query)){
        echo "ERROR: Could not update game id. " . mysqli_error($link);
        exit();
    }

    header("Location: $redirect_url");
    exit();

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

    <div class="actions">
        <a href="<?php echo $url; ?>">Place a Bet</a>
    </div>

    <?php if (!isset($error)) { ?>
    <div class="bets">
        <h2>Upcoming Bets</h2>
        <?php if (count($upcoming_user_bets) > 0) { ?>
        <table>
            <thead>
                <tr>
                    <th>Bet Type</th>
                    <th>Bet Date</th>
                    <th>Bet Amount</th>
                    <th>Payout</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($upcoming_user_bets as $bet) { ?>
                <tr>
                    
                    <td>
                        <?php
                            if ($bet['bet_type'] == 'home_win')
                                echo 'Home Win';
                            else
                                echo 'Away Win';
                        ?>
                    </td>
                    <td><?php echo htmlspecialchars($bet['bet_date']); ?></td>
                    <td>$<?php echo htmlspecialchars(number_format($bet['bet_amount'], 2)); ?></td>
                    <td>$<?php echo htmlspecialchars(number_format($bet['payout'], 2)); ?></td>
                    <td>
                        <form id="double-down" style="display: flex; justify-content: center; align-items: center;" method="POST" action="">
                            <input type="hidden" name="bet_id" value="<?php echo $bet['bet_id']; ?>">
                            <button type="submit" name="double-down" style="white-space: nowrap;">Double Down</button>
                        </form>
                    </td>
                    <td>
                        <form id="simulate" style="display: flex; justify-content: center; align-items: center;" method="POST" action="">
                            <input type="hidden" name="bet_id" value="<?php echo $bet['bet_id']; ?>">
                            <input type="hidden" name="game_id" value="<?php echo $bet['game_id']; ?>">
                            <input type="hidden" name="odds_id" value="<?php echo $bet['odds_id']; ?>">
                            <button type="submit" name="simulate">Simulate</button>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
        <?php } else { ?>
        <p>You have no bets placed.</p>
        <?php } ?>

    <h2>Past Bets</h2>
    <?php if (count($past_user_bets) > 0) { ?>
    <table>
            <thead>
                <tr>
                    <th>Bet Type</th>
                    <th>Winner</th>
                    <th>Bet Date</th>
                    <th>Bet Amount</th>
                    <th>Payout</th>
                    
                </tr>
            </thead>
            <tbody>
                <?php foreach ($past_user_bets as $bet) { ?>
                <tr>
                    
                    <td>
                        <?php
                            if ($bet['bet_type'] == 'home_win')
                                echo 'Home Win';
                            else
                                echo 'Away Win';
                        ?>
                    </td>
                    <td><?php echo $bet['winning_team_id'] == $bet['home_team_id'] ? 'Home' : 'Away'; ?></td>
                    <td><?php echo htmlspecialchars($bet['bet_date']); ?></td>        
                    <td>$<?php echo htmlspecialchars(number_format($bet['bet_amount'], 2)); ?></td>
                    <td>$<?php echo htmlspecialchars(number_format($bet['payout'], 2)); ?></td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
        <?php } else { ?>
        <p>You have no bets placed.</p>
        <?php } ?>
    </div>
    <?php } ?>
</div>

</body>
</html>