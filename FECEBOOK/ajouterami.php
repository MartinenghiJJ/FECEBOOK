<?php

require('db.php');
require('Fecebook.php');


$n_post = $_GET['ami'];
$n_post2 = $_GET['user'];
$query="DELETE FROM demande_ami WHERE user_to='$n_post2' AND user_from='$n_post'";
$result = mysqli_query($con, $query);

$query2="INSERT INTO `ami`(`user1`, `user2`) VALUES ('$n_post','$n_post2')";
$query3="INSERT INTO `ami`(`user1`, `user2`) VALUES ('$n_post2','$n_post')";


$result2 = mysqli_query($con, $query2);
$result3 = mysqli_query($con, $query3);





?>