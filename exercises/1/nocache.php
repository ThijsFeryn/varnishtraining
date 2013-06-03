<?php
header("Cache-Control: max-age=0");
?>
<h1>Exercise 1</h1>
<h2>No cache</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>