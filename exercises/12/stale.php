<?php
sleep(5);
header("Cache-Control: public,s-maxage= 10,stale-while-revalidate=3,stale-if-error=60");
?>
<h1>Exercise 12</h1>
<h2>S-maxage: 10 seconds</h2>
<h2>Stale while revalidate: 3 seconds</h2>
<h2>Stale if error: 10 seconds</h2>
<?php
echo date("Y-m-d H:i:s").'<br/>';
?>
<a href="/">Back to index</a>
