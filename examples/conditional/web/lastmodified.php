<?php
header('Last-Modified: ' . gmdate('D, d M Y H:i:s', filemtime(__FILE__)) . ' GMT');
header("Cache-Control: s-maxage= 10, stale-while-revalidate=2");
if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) &&
    strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) >= filemtime(__FILE__))
{
    header('HTTP/1.0 304 Not Modified');
    exit;
}
sleep(5);
echo date('Y-m-d H:i:s').'<br />'.PHP_EOL;