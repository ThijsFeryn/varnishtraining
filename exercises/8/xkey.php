<?php
header("Cache-Control: public,must-revalidate,s-maxage= 3600");
$keys = "";
$keysHeader = "";
foreach(explode(',',$_GET['keys']) as $key) {
    $keys .= "<li>{$key}</li>".PHP_EOL;
    $keysHeader .= "{$key} ";
}
header("xkey: {$keysHeader}");    
?>
<h1>Exercise 8</h1>
<h2>Invalidate cache using xkeys</h2>
<h2>Set keys using the "keys" query string parameter</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
?>
<h3>Current keys:</h3>
<ul>
    <?php echo $keys; ?>
</ul>
<a href="/">Back to index</a>