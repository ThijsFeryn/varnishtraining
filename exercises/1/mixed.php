<?php
header('Expires: ' . gmdate('D, d M Y H:i:s', time()+3) . ' GMT');
header("Cache-Control: public,must-revalidate,max-age=10,s-maxage=5");
?>
<h1>Exercise 1</h1>
<h2>Public 5 seconds cache with s-maxage</h2>
<h2>Public 10 seconds cache with maxage</h2>
<h2>15 seconds expires</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>