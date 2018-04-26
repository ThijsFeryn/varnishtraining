<?php
header('Cache-control: public, s-maxage=10');
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;
echo "Server: ".$_SERVER['HOSTNAME'].'<br />'.PHP_EOL;
echo "IP: ".$_SERVER['REMOTE_ADDR'].'<br />'.PHP_EOL;
echo "X-Forwarded-For: ".$_SERVER['HTTP_X_FORWARDED_FOR'].'<br />'.PHP_EOL;