<?php
$esi = false;
header('Cache-control: s-maxage=20s');
echo "Main timestamp: ".date('H:i:s').'<hr />'.PHP_EOL;

if(isset($_SERVER['HTTP_SURROGATE_CAPABILITY']) && preg_match('/ESI\/1\.0/',$_SERVER['HTTP_SURROGATE_CAPABILITY'])) {
    $esi = true;
}

