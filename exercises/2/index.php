<?php
header("Cache-Control: public,must-revalidate,max-age=10,s-maxage=5");
?>
<h1>Exercise 2</h1>
<h2>Public 5 seconds cache with s-maxage</h2>
<h2>Public 10 seconds cache with maxage</h2>
<h2>Varnish beresp.ttl 3 seconds</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>