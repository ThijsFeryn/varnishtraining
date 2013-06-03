<?php
header("Vary: Accept-language");
header("Cache-Control: public,must-revalidate,s-maxage= 20");
?>
<h1>Exercise 6</h1>
<h2>Cache variations ... part 1 (it's a bit flawed)</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
echo 'Language: '.$_SERVER['HTTP_ACCEPT_LANGUAGE'].'<br/>';
?>
<a href="/">Back to index</a>