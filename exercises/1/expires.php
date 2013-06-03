<?php
$expires = 10;
header('Expires: ' . gmdate('D, d M Y H:i:s', time()+$expires) . ' GMT');
?>
<h1>Exercise 1</h1>
<h2>Expires 10 seconds</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>