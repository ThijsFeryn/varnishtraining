<?php
header("Cache-Control: s-maxage=30");
?>
<h1>Exercise 3</h1>
<h2>Working with GET and POST</h2>
<?php
echo date("Y-m-d H:i:s").'<br/>';
if(isset($_POST['field1'])){
    echo 'Field 1 posted. Value:'.$_POST['field1'].'<br />';
}
?>
<form method="POST">
    <input type="text" name="field1" /><br />
    <input type="submit" /><br />
</form>
<a href="/">Back to index</a>
