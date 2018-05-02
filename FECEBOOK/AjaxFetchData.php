//Sql Query To Fetch News Feed From Database
$con= Initialize it with connection Details for database
$sql = "Select Top 50 from TblNews";
$result = $result=mysqli_query($con,$sql);
while($row =  $result->fetch_assoc())
{
    echo("<div class='NewsFeed'>");
    echo("<div class='title'>" . $row['title'] . "</div>");
    echo("<div class='body'>" . $row['body'] . "</div>");
    echo("</div>");
}