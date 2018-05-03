<?php
    include "db.php";
    

    $output = '';

    if(isset($_POST['search'])) {
    $search = $_POST['search'];
    $search = preg_replace("#[^0-9a-z]i#","", $search);

    $query = "SELECT username, profil FROM users WHERE username LIKE '%$search%'";
    $result = mysqli_query($con, $query) or die ("Could not search");
    $count = mysqli_num_rows($result);
    
    if($count == 0){
      $output = "There was no search results!";

    }else{

      while ($row = mysqli_fetch_array($result)) {

        $user = $row ['username'];
        $profilr = $row['profil'];
        header('Location: recherche.php');

      }

    }
     
    }      
    ?>