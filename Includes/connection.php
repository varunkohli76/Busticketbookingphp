<?php
$server_name = "localhost";
$username = "root";
$password = "";
$dbname = "bus_reservation";

// Establish the database connection
$conn = mysqli_connect($server_name, $username, $password, $dbname);

// Check the connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>
