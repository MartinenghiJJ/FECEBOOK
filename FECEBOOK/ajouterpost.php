    <?php
    require("Fecebook.php");
    require("db.php");
           
           $username= $_SESSION['username'];
            
           $post = stripslashes($_POST['contenu']);
	       $post = mysqli_real_escape_string($con,$post);
           

            if(null != $post)
            {   
            if(isset($_POST['ami']))
            {
                $statut = $_POST['ami'];
                $post  = mysqli_real_escape_string($con, $post);
                $trn_date = date("Y-m-d H:i:s");
                $query= "INSERT INTO `news` (`idAuteur`, `contenu`, `date`, `statut`) VALUES ('$username', '$post', '$trn_date', '$statut');";
                $result = mysqli_query($con,$query);
            }
                else{
                    
                    $post  = mysqli_real_escape_string($con, $post);
                    $trn_date = date("Y-m-d H:i:s");
                    $query= "INSERT INTO `news` (`idAuteur`, `contenu`, `date`) VALUES ('$username', '$post', '$trn_date');";
                    $result = mysqli_query($con,$query);
                }
                

            }

    ?>