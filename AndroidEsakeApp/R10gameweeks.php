<?php
	$data = array();

	$host="localhost";
	$uname="root";
	$pass="";
	$dbname="basketdb";
	
	$dbh = mysqli_connect($host,$uname,$pass) or die("cannot connect");
	mysqli_select_db($dbh, $dbname);
			
	$sql = "SELECT gameweek_id as gameweek FROM gameweek"; 

	$result = mysqli_query($dbh, $sql);
	while ($row = mysqli_fetch_array($result)) { 
		$data[$row['gameweek']] = $row['gameweek'];
		
	}
	
	header("Content-Type: application/json");
	echo json_encode($data);
	mysqli_close($dbh);
?>