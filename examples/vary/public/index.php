<?php
header('Cache-control: public, s-maxage=10');
header('Vary: Accept-Language');
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;
echo "Accept-Language: ".$_SERVER['HTTP_ACCEPT_LANGUAGE'].'<br />'.PHP_EOL;