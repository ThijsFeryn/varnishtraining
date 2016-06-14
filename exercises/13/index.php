<?php
header("Cache-Control: s-maxage=10");
header("Surrogate-Control: content='ESI/1.0'");
?>
<h1>Exercise 13</h1>
<h2>Edge Side Includes</h2>
<?php
echo date("Y-m-d H:i:s").'<br/>';
echo '<esi:include src="/exercises/13/edge.php?ttl=5" /><br />'.PHP_EOL;
echo '<esi:include src="/exercises/13/edge.php?ttl=0" /><br />'.PHP_EOL;
?>
<br /><a href="/">Back to index</a>