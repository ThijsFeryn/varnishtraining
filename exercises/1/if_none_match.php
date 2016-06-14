<?php
$etag = md5(filemtime(__FILE__));
header('Etag: ' . $etag);
header("Cache-Control: max-age= 10");
if (isset($_SERVER['HTTP_IF_NONE_MATCH']) &&  $_SERVER['HTTP_IF_NONE_MATCH'] == $etag) {
    header('HTTP/1.0 304 Not Modified');
    exit;
}
sleep(5);
?>
<h1>Exercise 1</h1>
<h2>If none match</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>