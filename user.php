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

      // Fetch user bets
      $bets_query = "SELECT bet_type, bet_date, bet_amount, payout FROM BETS_ON WHERE user_id = '$user_id'";
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
        <a href="bets.php">Place a Bet</a>
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
                </tr>
            </thead>
            <tbody>
                <?php foreach ($user_bets as $bet) { ?>
                <tr>
                    <td><?php echo htmlspecialchars($bet['bet_type']); ?></td>
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