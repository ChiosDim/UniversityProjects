<?php
	$data = array();

	$host="localhost";
	$uname="root";
	$pass="";
	$dbname="basketdb";
	
	$dbh = mysqli_connect($host,$uname,$pass) or die("cannot connect");
	mysqli_select_db($dbh, $dbname);
			
	$sql = "SELECT players.name, playerssstatistics.shoot1p, playerssstatistics.shoot2p, playerssstatistics.shoot3p, 
	playerssstatistics.rebound, playerssstatistics.assist, playerssstatistics.gameweek, playerssstatistics.eval_sys
    FROM players
    INNER JOIN playerssstatistics ON players.player_id = playerssstatistics.player_id
    ORDER BY gameweek ASC, eval_sys DESC;";

	$result = mysqli_query($dbh, $sql);
	while ($row = mysqli_fetch_array($result)) { 
		$nested_data = array();
		$nested_data['name'] = $row['name'];
		$nested_data['shoot1p'] = $row['shoot1p'];
		$nested_data['shoot2p'] = $row['shoot2p'];
		$nested_data['shoot3p'] = $row['shoot3p'];
		$nested_data['rebound'] = $row['rebound'];
		$nested_data['assist'] = $row['assist'];
		$nested_data['gameweek'] = $row['gameweek'];
		$nested_data['eval_sys'] = $row['eval_sys'];
		$data[$row['name']] = $nested_data;
		
	}
	header("Content-Type: application/json");
	echo json_encode($data);
	mysqli_close($dbh);
?>
