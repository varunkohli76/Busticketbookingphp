<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Seat Booking</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>

<body>  
    <?php include_once('../Includes/header.php'); ?>
    <h1>BUS LAYOUT</h1>
    <div class="box1">
        <form action="bookseats.php" method="post">
            <div class="seats-container">
                <?php
                include('../Includes/connection.php');

                if (isset($_GET['route_id']) && isset($_GET['bus_id'])) {
                    $routeId = $_GET['route_id'];
                    $busId = $_GET['bus_id'];
                    $date = $_GET['departure_date'];
                    $query = "SELECT Seats_id, Seats_Name FROM bus_seatstable WHERE Bus_Id = ?";
                    $stmt = mysqli_prepare($conn, $query);

                    if (!$stmt) {
                        die("Error: " . mysqli_error($conn));
                    }

                    mysqli_stmt_bind_param($stmt, "i", $busId);
                    mysqli_stmt_execute($stmt);

                    $result = mysqli_stmt_get_result($stmt);

                    while ($row = mysqli_fetch_assoc($result)) {
                        echo '<div class="Seat-box">';
                        echo '<input type="checkbox" name="seats[]" id="seat' . $row['Seats_id'] . '" value="' . $row['Seats_id'] . '">';
                        echo '<label for="seat' . $row['Seats_id'] . '">' . $row['Seats_Name'] . '</label>';
                        echo '</div>';
                    }
                    echo  '<input type="hidden" name="route_id" value="' . $routeId . '">';
                    echo  '<input type="hidden" name="bus_id" value="' . $busId . '">';
                    echo '<input type="hidden" name="date" value="' . $date . '">';
                }
                ?>
            </div>
            <button class="btn btn-primary btn35">Book Selected Seats</button>
        </form>
    </div>
</body>

</html>