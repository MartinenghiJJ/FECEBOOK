    <?php
        require('Fecebook.php');
        require('db.php');
        $aut = $_GET['pAut'];
        $id = $_GET['id'];
        $username= $_SESSION['username'];
        if(isset($_POST['commentaire']))
            {
                
                require('db.php');
               
                
                $comment = stripslashes($_POST['commentaire']);
                $comment = mysqli_real_escape_string($con,$comment);
    
                if($comment!="")
                {
                    echo '<script>alert("Commentaire posté");</script>';
                    $queryc = "INSERT INTO commentaire ( `idPost`, `pPost`, `PComment`, `Contenu`) VALUES ('$id','$aut' , '$username', '$comment' )";
                    $resultc = mysqli_query($con, $queryc);
                    
    
                }
            else{
    
                echo '<script>alert("Champ nul");</script>';
    
            } 
            }
?>