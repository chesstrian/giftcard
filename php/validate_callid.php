#!/usr/bin/php -q

<?php
include "db.inc.php";

$link = mysql_connect($host,$user,$pass);
mysql_select_db($db_0);

$ans = "callidvalid";

$callid = $argv[1];
$curdate = date("Y-m-d");

$sel = "SELECT COUNT(*) as attempts FROM call_log WHERE callerid = $callid AND end_epoch BETWEEN '$curdate 00:00:00' AND NOW() AND ivr='recordcard' AND result='failed'";
$res = mysql_query($sel);

if($row = mysql_fetch_object($res))
  if($row->attempts >= 3)
    echo "SET VARIABLE $ans \"0\"";
  else
    echo "SET VARIABLE $ans \"1\"";
else
  echo "SET VARIABLE $ans \"1\"";

mysql_close($link);
?>
