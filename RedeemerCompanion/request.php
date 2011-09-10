<?php

mysql_connect("your.server.com", "database_username", "database_password") or die(mysql_error());

mysql_select_db("database_name") or die(mysql_error());

$code = mysql_real_escape_string($_GET["code"]);

$issue = mysql_real_escape_string($_GET["issue"]);

$query = "INSERT INTO codes (code, issue, redeemed) VALUES ('".$code."', '".$issue."', '0')";

mysql_query($query) or die(mysql_error());

?>