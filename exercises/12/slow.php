<?php
sleep(5);
header("Cache-Control: s-maxage=10");
?>
<h1>Exercise 12: grace mode</h1>
<h2>5 seconds loading time, 10 seconds cache with s-maxage.</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>
