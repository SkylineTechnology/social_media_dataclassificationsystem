<?php

$sitename = "Social Media Data Classification System";
$conn = mysqli_connect("localhost", "root", "", "dataclassificationsys_db");
if (!$conn) {
    die(mysqli_error($conn) . "Error connecting Database!");
}
?>