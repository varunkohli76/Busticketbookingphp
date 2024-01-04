<?php
include_once('Includes/connection.php');
$signinSuccess = false;
$errorMessage = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];


    if(empty($username)||empty($password)){
        $errorMessage = "Username or Password cannot be empty.";
      
    }
   else{
    $query = "SELECT * FROM `users` WHERE  `Username`= '$username'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $hashedPasswordFromDB = $user['Password'];
        if (password_verify($password, $hashedPasswordFromDB)) {
            $signinSuccess = true;
        } else {
            $errorMessage = "Incorrect password";
        }
    } else {
        $errorMessage = "User not found";
    }
}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEuGO TraVel</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="../Bus Ticket Reservation System/assets/css/bootstrap.min.css">
</head>

<body>
    <section>
        <div class="signin-form">
            <h2>Sign In</h2>
            <?php if ($errorMessage): ?>
                <div class="alert alert-danger">
                <?php echo $errorMessage; ?>
<button type="button" class="btn-close cl" data-bs-dismiss="alert"></button>
    </div>
<?php endif; ?>

<?php if ($signinSuccess): ?>
    <div class="alert alert-success" role="alert">
        Login Successfully!
    </div>
    <script>
        setTimeout(function () {
            window.location.href = './pages/Home.php';
        }, 2000); 
    </script>
<?php endif; ?>

            <form action="#" method="post" autocomplete="off">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" >

                <label for="password">Password:</label>
                <input type="password" id="password" name="password">

                <button type="submit" class="btn123">Sign In</button><br><br>
                <center><p>Don't have any account<a href="./pages/Signup.php">Register Here</a></p></center>
            </form>
        </div>
    </section>
<script src="./assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
