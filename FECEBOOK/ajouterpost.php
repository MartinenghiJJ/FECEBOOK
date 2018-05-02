    <?php
    require("Fecebook.php");
    require("db.php");
           
           $username= $_SESSION['username'];
           $query2="SELECT `id` FROM `users` WHERE username='$username'" ;
           $result2= mysqli_query($con, $query2);
           $id= mysqli_fetch_assoc($result2); 
           $id=implode($id);
           $post = $_POST['contenu'];

            if(null != $post)
            {   
            if(isset($_POST['prive']))
            {
                $statut = $_POST['prive'];
                $post  = mysqli_real_escape_string($con, $post);
                $trn_date = date("Y-m-d H:i:s");
                $query= "INSERT INTO `news` (`idAuteur`, `contenu`, `date`, `statut`) VALUES ('$id', '$post', '$trn_date', '$statut');";
                $result = mysqli_query($con,$query);
            }
                else{
                    
                    $post  = mysqli_real_escape_string($con, $post);
                    $trn_date = date("Y-m-d H:i:s");
                    $query= "INSERT INTO `news` (`idAuteur`, `contenu`, `date`) VALUES ('$id', '$post', '$trn_date');";
                    $result = mysqli_query($con,$query);
                }
                

            }

    ?>