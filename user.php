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
      $bets_query = "SELECT bet_id, bet_type, bet_date, bet_amount, payout FROM BETS_ON WHERE user_id = '$user_id'";
      $bets_result = mysqli_query($link, $bets_query);
      if (mysqli_num_rows($bets_result) > 0) {
          while ($bet = mysqli_fetch_assoc($bets_result)) {
              $user_bets[] = $bet;
          }
      }
  } else {
      $error = "User not found.";
  }
} else {
  $error = "No username provided.";
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['delete-bet'])) {
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

    <div class="actions">
        <a href="<?php echo $url; ?>">Place a Bet</a>
    </div>

    <?php if (!isset($error)) { ?>
    <div class="bets">
        <h2>Your Bets</h2>
        <?php if (count($user_bets) > 0) { ?>
        <table>
            <thead>
                <tr>
                    <th>Bet Type</th>
                    <th>Bet Date</th>
                    <th>Bet Amount</th>
                    <th>Payout</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($user_bets as $bet) { ?>
                <tr>
                    
                    <td><?php echo htmlspecialchars($bet['bet_type']); ?></td>
                    <td><?php echo htmlspecialchars($bet['bet_date']); ?></td>
                    <td>$<?php echo htmlspecialchars(number_format($bet['bet_amount'], 2)); ?></td>
                    <td>$<?php echo htmlspecialchars(number_format($bet['payout'], 2)); ?></td>
                    <td><form>
                        <input type="hidden" name="bet_id" value="<?php echo $bet['bet_id']; ?>">
                        <button>Double Down</button></form>
                    </td>
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