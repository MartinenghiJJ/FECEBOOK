<?php
include('Fecebook.php');
if(isset($_POST["add"]))
{
   $ami = $row['username'];
   $user = $_SESSION['username'];
    
    echo $ami;
}
?>