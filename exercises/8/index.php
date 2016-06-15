<?php
header("Cache-Control: public,must-revalidate,s-maxage= 3600");
?>
<h1>Exercise 8</h1>
<h2>Invalidate cache</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
?>
<a href="/">Back to index</a>