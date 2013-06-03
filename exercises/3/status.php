<?php
header('HTTP/1.1 202 Accepted');
?>
<h1>Exercise 3</h1>
<h2>Non-cacheable status code (by default)</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
?>
<a href="/">Back to index</a>