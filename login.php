<!DOCTYPE html>
<!-- BeaverBets Login -->
<html>
<head>
    <title>BeaverBets Login</title>
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

    $query = "SELECT user_id, user_name, balance FROM USER WHERE user_name = '$username'";
    $result = mysqli_query($link, $query);

    if (mysqli_num_rows($result) > 0) {
        header("Location: user.php?username=" . urlencode($username));
        exit();
    } else {
        $error = "Invalid username.";
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
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
