<?php
header("Cache-Control: private,must-revalidate,max-age=10,s-maxage=5");
?>
<h1>Exercise 1</h1>
<h2>Mixed headers, doesn't caches</h2>
<h2>15 seconds expires</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>