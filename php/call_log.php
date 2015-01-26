#!/usr/bin/php -q

<?php
include "db.inc.php";

$link = mysql_connect($host,$user,$pass);
mysql_select_db($db_0);

$uniqueid = $argv[1];
$callerid = $argv[2];
$startepoch = $argv[3];
$endepoch = $argv[4];
$card = $argv[5];
$ivr = $argv[6];
$result = $argv[7];

if($card == "") $card = "0000000000";
if($result == "") $result = "failed";

$ins = "INSERT INTO call_log VALUES ('','$uniqueid','$callerid','$startepoch','$endepoch','$card','$ivr','$result')";
mysql_query($ins);

mysql_close($link);
?>
