<?php
header('Cache-control: no-cache');
$curl = curl_init('http://localhost/');
curl_setopt_array($curl,[
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_CUSTOMREQUEST => 'PURGE'
]);
echo curl_exec($curl).PHP_EOL;
