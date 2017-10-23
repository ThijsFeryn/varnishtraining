<?php
$etag = md5(filemtime(__FILE__));
header('Etag: ' . $etag);
header("Cache-Control: s-maxage= 10, stale-while-revalidate=6");
if (isset($_SERVER['HTTP_IF_NONE_MATCH']) &&  $_SERVER['HTTP_IF_NONE_MATCH'] == $etag) {
    header('HTTP/1.0 304 Not Modified');
    exit;
}
sleep(5);
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;