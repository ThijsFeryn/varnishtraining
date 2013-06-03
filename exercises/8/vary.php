<?php
header("Vary: Accept-language");
header("Cache-Control: public,must-revalidate,s-maxage= 3600");
?>
<h1>Exercise 8</h1>
<h2>Invalidate cache &amp; cache variations</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
echo 'Language: '.$_SERVER['HTTP_ACCEPT_LANGUAGE'].'<br/>';
?>
<h4>Invalidate me</h4>
<pre>
curl -X PURGE http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].PHP_EOL; ?>
curl -X BAN http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].PHP_EOL; ?>
curl -X BANALL http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].PHP_EOL; ?>
curl -X DUMBBAN http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].PHP_EOL; ?>
curl -X REFRESH http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].PHP_EOL; ?>
</pre>
<a href="/">Back to index</a>