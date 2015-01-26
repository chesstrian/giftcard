#!/usr/bin/php -q

<?php
include "db.inc.php";

$link = mysql_connect($host,$user,$pass);
mysql_select_db($db_0);

$ans = "cardstate";

$card = $argv[1];
$callid = $argv[2];

$sel = "SELECT * FROM card WHERE code = $card AND expiration_date > NOW() AND active = 1";
$res = mysql_query($sel);

if($row = mysql_fetch_object($res)) {
  $upd = "UPDATE card SET use_date = NOW(), callerid = '$callid', active = 0";
  mysql_query($upd);

  echo "SET VARIABLE $ans \"1\"";
} else {
  echo "SET VARIABLE $ans \"0\"";
}

$mysql_close($link);
?>
