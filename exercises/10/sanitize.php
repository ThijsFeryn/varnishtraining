<h1>Exercise 10</h1>
<h2>Sanitize URL</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
$host = preg_replace('/:[0-9]+/','',$_SERVER['HTTP_HOST']);
$port = 'http://'.$host.':80'.$_SERVER['SCRIPT_NAME'];
$question = 'http://'.$host.$_SERVER['SCRIPT_NAME'].'?';
$hash = 'http://'.$host.$_SERVER['SCRIPT_NAME'].'#abc';
?>
<h4>Try these URL's</h4>
<?php
echo "<a href='$port'>$port</a><br />";
echo "<a href='$question'>$question</a><br />";
echo "<a href='$hash'>$hash</a><br />";
?>
<br/><a href="/">Back to index</a>