<?php
header('Last-Modified: ' . gmdate('D, d M Y H:i:s', filemtime(__FILE__)) . ' GMT');
header("Cache-Control: max-age= 10");
if (isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) &&
    strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) >= filemtime(__FILE__))
{
    header('HTTP/1.0 304 Not Modified');
    exit;
}
sleep(5);
?>
<h1>Exercise 1</h1>
<h2>If modified Since</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>