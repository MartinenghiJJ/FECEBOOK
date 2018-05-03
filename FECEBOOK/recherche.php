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

      }

    }
     
    }      
    ?>
    
    <?php
    require("db.php");

        $username= $_SESSION['username'];
        


        $query3="SELECT contenu, idAuteur FROM `news` WHERE (news.idAuteur='$user')";;
        $result3= mysqli_query($con, $query3);
    
    
    
    ?>
    
    
    <?php
    
    require("db.php");
    $username= $_SESSION['username'];
    $query4="SELECT * FROM `ami` WHERE (user1='$username' and user2='$user')";;
    $result4= mysqli_query($con, $query4);
    $row4 = $result4->fetch_assoc();
    
    
    
    
    
    ?>
    
    <?php
    $query5="SELECT * FROM `demande_ami` WHERE (user_from='$username' and user_to='$user')";;
    $result5= mysqli_query($con, $query5);
    $row5 = $result5->fetch_assoc();
    
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
        
        <li class="active"><a href="public.php">Réseau</a></li>
        <li class="active"><a href="albumphoto.php">Album</a></li>
      </ul>
        
        <!-- ICI --> 
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
        <p><a href="#"><?php echo $user; ?></a></p>
        <img src=<?php echo "image/".$profilr ?> height="100" width="100" alt="Avatar">
         
          
          
      </div>
            <p><a href="#">Link</a></p>
    
                <?php                   
                if(isset($row4['user2']))
                {   
                    
                    
                        echo("<form class='navbar-form navbar-right' action='supprimerami.php?user=$user' method='post' autocomplete='off'>
                        <input name ='demande' type='submit' class='btn btn-primary' value='Supprimer Ami'/>  
                        </form>");
                        
                    
                    
                }
                
                else
                {
                    if(isset($row5['user_from']))
                    {
                        echo ("<div class='alert alert-success fade in'>
                                <a href='#' class='close' data-dismiss='alert' aria-label='close'>×</a>
                                <p><strong>Demande en attente</strong></p>
                                </div>");
                    }
                    else
                    {
                        
                    
                    echo("<form class='navbar-form navbar-right' action='demandeami.php?user=$user' method='post' autocomplete='off'>
                    <input name ='demande' type='submit' class='btn btn-primary' value='Ajouter Ami'/>  
                    </form>");
                    }
                }
                
             
                
                
    
                ?>
            
        
         
        
      
    
        
    </div>
    <div class="col-sm-7">
    
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-left">
          </div>
        </div>
      </div>
        <div class="col-sm-9">

            <div class="div_post_submit">

                    
                    <form action="ajouterpost.php" method="post">
                         <div id="div_post_content">
                            <textarea rows="5" cols="80" name="contenu" id="post_textarea"></textarea>
                             
                         </div>
                        <input type="checkbox" id="prive" name="prive" value="prive"/> <label>Mode Ami</label><br>  
                        <input type="submit" id="envoyer" name="envoyer" value="envoyer">
                    </form><br>
                    <form action="ajouterimage.php" method="post">
                    
                    <input type="file" name ="photo" id="photo">
                    
                    <input type="submit" id="upload" name="upload" value="upload">
                    </form><br>
                 <?php   while($row2 = $result3->fetch_assoc())
                    {
                        echo("<div class='row'>
                                <div class='col-sm-3'>
                                    <div class='well'>
                                        <p>".$row2['idAuteur']."</p>
                                        
                                        
                                    </div>
                                </div>
                                
                                
                                
                                
                              <div class='col-sm-9'>
                                <div class='well'>
                                    <p>".$row2['contenu'] ."</p>
                                    <button type='button' class='btn btn-default btn-sm'>
                                    <span class='glyphicon glyphicon-thumbs-up'></span> Like
                                    </button>
                                        
                                    <button type='button' class='btn btn-default btn-sm'>
                                    <span class='glyphicon glyphicon glyphicon-pencil'></span> Comment
                                    </button>    
                                </div>
                            </div>
                            </div>");

             
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