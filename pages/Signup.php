<?php
include('../Includes/connection.php');
$errors = [];
$signupSuccess = false;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = $_POST['password'];

    if (empty($username)) {
        $errors['username'] = "Please enter a username.";
    }

    if (empty($email)) {
        $errors['email'] = "Please enter an email address.";
    } elseif (!preg_match("/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/", $email)) {
        $errors['email'] = "Invalid email format.";
    }

    if (empty($phone)) {
        $errors['phone'] = "Please enter a phone number.";
    } elseif (!preg_match("/^[0-9]{10}$/", $phone)) {
        $errors['phone'] = "Invalid phone number. Please enter a 10-digit phone number.";
    }

    if (empty($password)) {
        $errors['password'] = "Please enter a password.";
    } 

    if (empty($errors)) {
        $hashed_pass = password_hash($password,PASSWORD_DEFAULT);

        $query = "INSERT INTO users (username, email, phone, password) VALUES ('$username', '$email', '$phone', '$hashed_pass')";
        $result = mysqli_query($conn, $query);

        if ($result) {
            $signupSuccess = true;
        } else {
            echo "Error: " . mysqli_error($conn);
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
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
</head>
<body>
    <div class="signup-form">
        <h2>Sign Up</h2>
        
        <?php if ($signupSuccess): ?>
            <div class="alert alert-success" role="alert">
                Account created successfully.
            </div>
            <script>
                setTimeout(function() {
                    window.location.href = '../index.php';
                }, 1000);
            </script>
        <?php endif; ?>
        <!-- Sign Up Form -->
        <form action="?" method="post" autocomplete="off">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username">
            <?php echo isset($errors['username']) ? '<p class="error">' . $errors['username'] . '</p>' : ''; ?>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone">
            <?php echo isset($errors['phone']) ? '<p class="error">' . $errors['phone'] . '</p>' : ''; ?>

            <label for="email">Email:</label>
            <input type="text" id="email" name="email">
            <?php echo isset($errors['email']) ? '<p class="error">' . $errors['email'] . '</p>' : ''; ?>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
            <?php echo isset($errors['password']) ? '<p class="error">' . $errors['password'] . '</p>' : ''; ?>

            <button type="submit" class="btn btn-primary">Sign Up</button>
            <center><p>Already have an account<a href="../index.php">Sign in</a></p></center>
        </form>
    </div>
</body>

</html>
