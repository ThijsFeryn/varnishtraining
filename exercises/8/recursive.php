<?php
header("Cache-Control: public,must-revalidate,s-maxage= 3600");
?>
<h1>Exercise 8</h1>
<h2>Recursive invalidation</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
?>
<h4>Try the following URL's</h4>
<a target="_blank" href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'/test'.PHP_EOL; ?>">http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'/test'.PHP_EOL; ?></a><br />
<a target="_blank" href="http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'/test/123'.PHP_EOL; ?>">http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'/test123'.PHP_EOL; ?></a>
<h4>Invalidate me</h4>
<pre>
curl -X BANALL http://<?php echo $_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].PHP_EOL; ?>
</pre>
<a href="/">Back to index</a>