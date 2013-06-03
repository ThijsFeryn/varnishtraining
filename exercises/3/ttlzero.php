<?php
header("Cache-Control: public,must-revalidate,max-age=10,s-maxage=0");
?>
<h1>Exercise 3</h1>
<h2>Zero TTL</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
?>
<a href="/">Back to index</a>