<h1>Overview of examples</h1>
<ul>
<?php
$directory = new RecursiveDirectoryIterator('exercises');
$iterator = new RecursiveIteratorIterator($directory);
$regex = new RegexIterator($iterator, '/^.+\.php$/i', RecursiveRegexIterator::GET_MATCH);
foreach($regex as $phpFile=>$value){
    if(preg_match('/vendor/',$phpFile)){
        continue;
    }
    echo "<li><a href='{$phpFile}'>{$phpFile}</a></li>".PHP_EOL;
}
?>
</ul>