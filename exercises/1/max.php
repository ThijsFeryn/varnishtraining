<?php
header("Cache-Control: public,must-revalidate,max-age= 10");
?>
<h1>Exercise 1</h1>
<h2>Public 10 seconds cache</h2>
<?php
echo date("Y-m-d H:i:s").'<br/>';
?>
<a href="/">Back to index</a>