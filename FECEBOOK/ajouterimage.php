<?php
    require("Fecebook.php");
    require("db.php");
           
           $username= $_SESSION['username'];
           $photo = $_POST['photo'];
           $photo = "image/".$_POST['photo'];

            if(null != $photo)
            {   
            if(isset($_POST['prive']))
            {
                $statut = $_POST['prive'];
                $post  = mysqli_real_escape_string($con, $photo);
                $trn_date = date("Y-m-d H:i:s");
                $query= "INSERT INTO `photo` (`idAuteur`, `photo`, `date`, `statut`) VALUES ('$username', '$photo', '$trn_date', '$statut');";
                $result = mysqli_query($con,$query);
            }
                else{
                    
                    $post  = mysqli_real_escape_string($con, $photo);
                    $trn_date = date("Y-m-d H:i:s");
                    $query= "INSERT INTO `photo` (`idAuteur`, `photo`, `date`) VALUES ('$username', '$photo', '$trn_date');";
                    $result = mysqli_query($con,$query);
                }
                

            }

    ?>