<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Registration</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<?php
require('db.php');
// If form submitted, insert values into the database.
if (isset($_REQUEST['username'])){
        // removes backslashes
	$username = stripslashes($_REQUEST['username']);
        //escapes special characters in a string
	$username = mysqli_real_escape_string($con,$username); 
	$email = stripslashes($_REQUEST['email']);
	$email = mysqli_real_escape_string($con,$email);
	$password = stripslashes($_REQUEST['password']);
	$password = mysqli_real_escape_string($con,$password);
    $nom = stripslashes($_REQUEST['nom']);
	$nom = mysqli_real_escape_string($con,$nom);
	$prenom = stripslashes($_REQUEST['prenom']);
	$prenom = mysqli_real_escape_string($con,$prenom);
    $adresse = stripslashes($_REQUEST['adresse']);
	$adresse = mysqli_real_escape_string($con,$adresse);
	$ville = stripslashes($_REQUEST['ville']);
	$ville = mysqli_real_escape_string($con,$ville);
	$prof = stripslashes($_REQUEST['profil']);
	$prof = mysqli_real_escape_string($con,$prof);
	$couv = stripslashes($_REQUEST['couverture']);
	$couv = mysqli_real_escape_string($con,$couv);
    $statut = stripslashes($_REQUEST['statut']);
	$statut = mysqli_real_escape_string($con,$statut);


	$trn_date = date("Y-m-d H:i:s");
        $query = "INSERT into `users` (username, password, email, nom, prenom, adresse, ville, profil, couverture, statut, trn_date)
VALUES ('$username', '".md5($password)."', '$email', '$nom', '$prenom', '$adresse', '$ville', '$prof', '$couv', '$statut', '$trn_date')";
        $result = mysqli_query($con,$query);
        if($result){
            echo "<div class='form'>
<h3>You are registered successfully.</h3>
<br/>Click here to <a href='login.php'>Login</a></div>";
        }
    }else{
?>
<div class="form">
<h1>Registration</h1>
<form name="registration" action="" method="post">
<input type="text" name="username" placeholder="Username" required />
<input type="email" name="email" placeholder="Email" required />
<input type="password" name="password" placeholder="Password" required />
<input type="text" name="nom" placeholder="Nom" required />
<input type="text" name="prenom" placeholder="Prenom" required />
<input type="text" name="adresse" placeholder="Adresse" required />
<input type="text" name="ville" placeholder="Ville" required />
<input type="text" name="statut" placeholder="Statut" required />
<input type="file" name="profil" placeholder="Photo de Profil" required />
<input type="file" name="couverture" placeholder="Photo de Couverture" required />
<input type="submit" name="submit" value="Register" />
    
</form>
</div>
<?php } ?>
</body>
</html>