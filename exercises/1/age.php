<?php
header("Age: 25");
header("Cache-Control: public,must-revalidate,s-maxage=30");
?>
<h1>Exercise 1</h1>
<h2>30 seconds s-maxage</h2>
<h2>25 seconds age</h2>
<?php
echo date("Y-m-d H:i:s").'<br />';
?>
<a href="/">Back to index</a>