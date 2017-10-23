<?php
$expires = 10;
header('Expires: ' . gmdate('D, d M Y H:i:s', time()+$expires) . ' GMT');
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;
