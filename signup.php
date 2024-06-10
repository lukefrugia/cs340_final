<!DOCTYPE html>
<!-- BeaverBets Create User -->
<html>
<head>
    <title>BeaverBets Create User</title>
    <link rel="stylesheet" href="login.css">
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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = mysqli_real_escape_string($link, $_POST['username']);
    $balance = mysqli_real_escape_string($link, $_POST['balance']);

    $check_query = "SELECT user_name FROM USER WHERE user_name = '$username'";
    $check_result = mysqli_query($link, $check_query);

    if (mysqli_num_rows($check_result) > 0) {
        $error = "Username already exists. Please choose another.";
    } else {
        $query = "INSERT INTO USER (user_name, balance) VALUES ('$username', '$balance')";
        if (mysqli_query($link, $query)) {
            header("Location: user.php?username=" . urlencode($username));
            exit();
        } else {
            $error = "ERROR: Could not execute $query. " . mysqli_error($link);
        }
    }
}

mysqli_close($link);
?>

<div class="container">
    <img src="benny.webp" alt="BeaverBets Logo" class="logo">
    <?php if (isset($error)) { echo "<p class='error'>$error</p>"; } ?>
    <form method="POST" action="">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="balance">Initial Balance:</label>
        <input type="number" id="balance" name="balance" required>
        <input type="submit" value="Create Account">
    </form>
</div>

</body>
</html>
