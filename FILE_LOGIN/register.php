<?php
$db = mysqli_connect('localhost', 'root', '', 'aplikasi_login');
if (!$db) {
    echo "Database connection faild";
}

$password = $_POST['password'];
$username = $_POST['username'];


$sql = "SELECT username FROM login WHERE username = '" . $username . "'";

$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
    echo json_encode("Error");
} else {
    $insert = "INSERT INTO login(username,password)VALUES('" . $username . "','" . $password . "')";
    $query = mysqli_query($db, $insert);
    if ($query) {
        echo json_encode("Success");
    }
}
