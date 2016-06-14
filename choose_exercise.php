<?php

function exercise($start,$end,$sub=false)
{
    $subEx = '';
    if($sub){
        $subEx = 'sub-';
    }
    while(true){
        $exercise = readline('Choose your '.$subEx.'exercise ('.(int)$start .'-'.(int)$end.'): ').PHP_EOL;
        if((int)$exercise >= $start && (int)$exercise<=$end) {
            break;
        }
        if(strlen(trim($exercise)) == 0) {
            exit(0);
        }
    }
    return trim($exercise);
}
$exercise = exercise(1,13);
switch($exercise) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 12:
    case 13:
        $file = $exercise.'.vcl';
        break;
    case 7:
        $file = $exercise.'.'.exercise(1,7,true).'.vcl';
        break;
    case 8:
        $file = $exercise.'.'.exercise(1,5,true).'.vcl';
        break;
    case 9:
        $file = $exercise.'.'.exercise(1,4,true).'.vcl';
        break;
    case 10:
        $file = $exercise.'.'.exercise(1,3,true).'.vcl';
        break;
    case 11:
        $file = $exercise.'.'.exercise(1,5,true).'.vcl';
        break;

}
$file = dirname(__FILE__).'/vcl/'.$file;
if(!file_exists($file)) {
    echo "File '{$file}' not found".PHP_EOL;
    exit(1);
}
copy($file,'/etc/varnish/default.vcl');
exec('service varnish restart');
echo "$file is now loaded".PHP_EOL;
exit(0);