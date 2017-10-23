<?php
header('Cache-control: public, s-maxage=10');
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;
echo "Language cookie: ".$_COOKIE['language'].'<br />'.PHP_EOL;