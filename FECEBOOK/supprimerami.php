<?php
include('Fecebook.php');
include('db.php');
$n_post = $_GET['user'];
if(isset($n_post))
{
    echo '<script>alert("Supprimé");</script>';
    $username= $_SESSION['username'];

    $query = "DELETE FROM `ami` WHERE user1='$username' AND user2='$n_post'";
    $result = mysqli_query($con, $query);
    
    $query2 = "DELETE FROM `ami` WHERE user1='$n_post' AND user2='$username'";
    $result2 = mysqli_query($con, $query2);
    
    echo $username;
    
}


?>