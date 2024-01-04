<?php
include('../Includes/connection.php');
$arrivalQuery =  "SELECT DISTINCT Arrival FROM route_table";
$arrivalResult = mysqli_query($conn, $arrivalQuery);

$destinationQuery = "SELECT DISTINCT Destination FROM route_table";
$destinationResult = mysqli_query($conn, $destinationQuery);

if (!$arrivalResult || !$destinationResult) {
    die("Error: " . mysqli_error($conn));
}

$arrivalLocations = [];
while ($row = mysqli_fetch_assoc($arrivalResult)) {
    $arrivalLocations[] = $row['Arrival'];
}

$destinationLocations = [];
while ($row = mysqli_fetch_assoc($destinationResult)) {
    $destinationLocations[] = $row['Destination'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEuGO TraVel</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
</head>

<body>
    <?php include_once('../Includes/header.php'); ?>
    <section>
        <div class="row">
            <div class="col-lg-12 box">
                <form action="" method="post" id="bus-search-form">
                    <div class="row fields">
                        <div class="col-lg-3">
                            <label for="From">From:</label>
                            <select name="From" id="Arrival">
                                <option value="">Select</option>
                                <?php
                                foreach ($arrivalLocations as $location) {
                                    echo "<option value=\"$location\">$location</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="To">To:</label>
                            <select name="To" id="Destination">
                                <option value="">Select</option>
                                <?php
                                foreach ($destinationLocations as $location) {
                                    echo "<option value=\"$location\">$location</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="col-lg-3">
                            <label for="departure">Date of Departure:</label>
                            <input type="date" id="departure_date" name="departure" size="30" required>
                           
                        </div>
                        <div class="col-lg-3">
                            <button type="submit" id="btn7" class="btn3">Search Buses</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $from = $_POST['From'];
            $to = $_POST['To'];

            $query = "SELECT r.r_id, r.Route_Id, r.Bus_Id, r.Price, r.TotalSeats, rt.Arrival, rt.Destination, bd.Bus_Number
            FROM route r
            JOIN route_table rt ON r.Route_Id = rt.Route_Id
            JOIN bus_details bd ON r.Bus_Id = bd.Bus_Id
            WHERE rt.Arrival = ? AND rt.Destination = ?";
            $stmt = mysqli_prepare($conn, $query);


            mysqli_stmt_bind_param($stmt, "ss", $from, $to);

            mysqli_stmt_execute($stmt);

            $result = mysqli_stmt_get_result($stmt);

            if (mysqli_num_rows($result) > 0) {
                echo '<div class="row">';
                echo '<div class="col-lg-12 box">';
                echo '<h2>Matching Routes</h2>';
                echo '<ul>';
            
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<li class="matching-route">';
                    echo '<div class="horizontal-details">';
                    echo '<p>Arrival:<br> ' . $row['Arrival'] . '</p>';
                    echo '<p>Destination: ' . $row['Destination'] . '</p>';
                    echo '<p>Bus Number: ' . $row['Bus_Number'] . '</p>';
                    echo '<p>Price: <br>' . $row['Price'] . '</p>';
                    echo '<p>Total Seats: <br>' . $row['TotalSeats'] . '</p>';
                    echo '<a class="btn btn-primary btn20" href="seats.php?bus_id=' . $row['Bus_Id'] . '&route_id=' . $row['Route_Id'] . '&departure_date=' . $_POST['departure'] . '">Book Seats</a>';
                    echo '</div>';
                    echo '</li>';
                }
            
                echo '</ul>';
                echo '</div>';
                echo '</div>';
            } else {
                echo "<script>alert('No Route Found')</script>";
            }

            mysqli_stmt_close($stmt);
        }
        mysqli_close($conn);

        ?>
    </section>
</body>

</html>