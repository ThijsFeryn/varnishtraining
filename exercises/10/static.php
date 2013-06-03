<?php
setcookie('test',date('Y-m-d H:i:s'));
?>
<h1>Exercise 10</h1>
<h2>Cache static files, even when cookies are present</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
?>
<img src="combell.jpg" /><br />
<a href="/">Back to index</a>