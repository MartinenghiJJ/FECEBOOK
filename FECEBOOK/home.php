<?php
//include auth.php file on all secure pages
include("auth.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>FECEBOOK</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="CssProfil.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
  </style>
</head>
<body>
    <?php
    require("db.php");

    $username=$_SESSION['username'];
    $query = "SELECT `profil` FROM `users` WHERE username='$username'";
    $result =mysqli_query($con, $query);
    $profil= mysqli_fetch_assoc($result);  
?>
    
    <?php
    require("db.php");

        $username= $_SESSION['username'];


        $query3="SELECT contenu, id, idAuteur FROM `news` WHERE (news.idAuteur='$username')";
        $result3= mysqli_query($con, $query3);
    ?>
    
    
    



<nav class="navbar navbar-inverse">
  <div class="container-fluid main">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Fecebook.php">F'ECEBOOK</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <form action ="recherche.php" class="navbar-form navbar-right" method = "post">
        <div class="form-group input-group">
          <input name="search" type="text" class="form-control" placeholder="Search... "/>
            <span class="input-group-btn">
          <input type="submit" class="btn btn-default" value="Search"/>
            </span>
           </div>
          </form>
      <ul class="nav navbar-nav navbar-right">
          <li><a href="home.php"><span class="glyphicon glyphicon-user"></span><?php echo $_SESSION['username']; ?></a></li>
        <li><a href="Logout.php"><span class="glyphicon glyphicon glyphicon-off"></span> Logout</a></li>  
      </ul>
    </div>
  </div>
</nav>
  
<div class="container text-center">    
  <div class="row">
    <div class="col-sm-3 well">
      <div class="well">
        <p><a href="#"><?php echo $_SESSION['username']; ?></a></p>
        <img src=<?php echo "image/".implode($profil) ?> height="200" width="200" alt="Avatar">
         
          
          
      </div>
      
      
    </div>
    <div class="col-sm-7">
    
      
        <div class="col-sm-9">

            <div class="div_post_submit">

                    
                    <form action="ajouterpost.php" method="post">
                         <div id="div_post_content">
                            <textarea rows="5" cols="80" name="contenu" id="post_textarea"></textarea>
                             
                         </div>
                        <input type="checkbox" id="prive" name="prive" value="prive"/> <label>Mode Ami</label><br>  
                        <input type="submit" class="btn btn-primary" id="envoyer" name="envoyer" value="envoyer">
                    </form><br>
                    <form action="ajouterimage.php" method="post">
                    
                    <input class="btn btn-primary"  type="file" name ="photo" id="photo">
                    
                    <input type="submit" class="btn btn-primary" id="upload" name="upload" value="upload">
                    </form><br>
                
                    <?php   while($row2 = $result3->fetch_assoc())
                    {
                        echo("<div class='row'>
                                <div class='col-sm-12'>
                                    <div class='panel panel-default'>
                                    <div class='panel-body'>
                                        <p>".$username ."</p>
                                        
                                    </div>
                                    <p>".$row2['contenu'] ."</p>
                                    <button type='button' class='btn btn-default btn-sm'>
                                    <span class='glyphicon glyphicon-thumbs-up'></span> Like
                                    </button>
                                        
                                    <button type='button' class='btn btn-default btn-sm' onclick='toggleForm()'>
                                    <span class='glyphicon glyphicon glyphicon-pencil'></span> Comment</button> 
                                    <form id='formulaire' method='POST' action='ajoutercommentaire.php?pAut=".$row2['idAuteur']."&id=".$row2['id']."'>
                                    <textarea name='commentaire' class='formulaire'></textarea>
                                    <input class='btn btn-primary' type='submit'/>
                                    </form>   
                                </div>
                            </div>
                            </div>");
                        $query5="SELECT Contenu, id, PComment FROM commentaire WHERE (idPost='".$row2['id']."')"; 
                        $result5=mysqli_query($con, $query5);
                        while($row5 = $result5->fetch_assoc())
                            {
                                 
                                       echo(" <div class='col-sm-9'>
                                        <div class='well'>
                                        Commentaire : 
                                        <p>".$row5['PComment']."</p>
                                        <p>".$row5['Contenu']."</p>
                                        
                                        
                                    </div>
                                </div>
                                  ");
                            }

             
                   } ?>
                
                
            </div>
        </div>
        
    
    </div>
    <div class="col-sm-2 well">
      <div class="thumbnail">
        <p>Upcoming Events:</p>
        <img src="paris.jpg" alt="Paris" width="400" height="300">
        <p><strong>Paris</strong></p>
        <p>Fri. 27 November 2015</p>
        <button class="btn btn-primary">Info</button>
      </div>        
    </div>
  </div>
</div>


</body>
</html>
