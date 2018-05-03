<?php
include('Fecebook.php');
include('db.php');
$n_post = $_GET['user'];
if(isset($n_post))
{
    echo '<script>alert("Demande Envoyée");</script>';
    $username= $_SESSION['username'];

    $query = "INSERT INTO demande_ami (`user_from`, `user_to`) VALUES ('$username', '$n_post' )";
    $result = mysqli_query($con, $query);
}


?>