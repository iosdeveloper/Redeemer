<?php

mysql_connect("your.server.com", "database_username", "database_password") or die(mysql_error());

mysql_select_db("database_name") or die(mysql_error());

$code = mysql_real_escape_string($_POST["code"]);

$query = "SELECT * FROM codes WHERE code = '".$code."'";

$result = mysql_query($query) or die(mysql_error());

$row = mysql_fetch_array($result);

if ($row['id'] && $row['redeemed'] == 0) {
	$query = "UPDATE codes SET redeemed = '1' WHERE code = '".$code."'";
	
	mysql_query($query) or die(mysql_error());
	
	echo $row['issue'];
}

?>