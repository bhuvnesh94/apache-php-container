<?php
 $user = $_POST['user'];
 $password = $_POST['password'];
$servername = "database-1.c2zgzuuhgthh.us-east-1.rds.amazonaws.com";
$username = "akash";
$Password = "q1234567";
$DB = "login";
// Create connection
$con = new mysqli("$servername", "$username", "$Password","$DB");
if($con->connect_error){
	die("failed to connect : " .$con->connect_error);
} else {
	$stmt = $con->prepare("select * from logintable where user = ?");
	$stmt->bind_param("s",$user);
	$stmt->execute();
	$stmt_result = $stmt->get_result();
	if($stmt_result->num_rows > 0) {
	  $data = $stmt_result->fetch_assoc();
		if($data['password'] ==$password) {
			echo "<h1>welcome</h1>";
		} else {
		 echo "<h2>Invalid password</h2>";

		}
	} else {
	 echo "<h2>kuch bhi name mt dalo</h2>";
	}
}?>
