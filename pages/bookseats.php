<?php
include('../Includes/connection.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['route_id'], $_POST['bus_id'], $_POST['date'], $_POST['seats'])) {
    $routeId = $_POST['route_id'];
    $busId = $_POST['bus_id'];
    $departureDate = $_POST['date'];
    $seatIds = $_POST['seats'];

    $insertQuery = "INSERT INTO `seats_booking` (Route_id, Bus_Id, Seats_id, dates) VALUES (?, ?, ?, ?)";
    $insertStmt = mysqli_prepare($conn, $insertQuery);

    if (!$insertStmt) {
        die("Error: " . mysqli_error($conn));
    }

    mysqli_stmt_bind_param($insertStmt, "iiis", $routeId, $busId, $seat, $departureDate);

    foreach ($seatIds as $seat) {
        mysqli_stmt_execute($insertStmt);
    }
    mysqli_stmt_close($insertStmt);

    echo "<script>alert('Seats Booked Successfully')</script>";
} else {
    echo "<script>alert('Please Select at least one Seat')</script>";
}

mysqli_close($conn);
?>
