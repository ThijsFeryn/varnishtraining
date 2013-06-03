<?php
header("Cache-Control: public,must-revalidate,s-maxage=10");
function esi($file){
    $url = 'http://'.$_SERVER['HTTP_HOST'].substr($_SERVER['SCRIPT_NAME'],0,1+strrpos($_SERVER['SCRIPT_NAME'],'/')).$file;
    if(isset($_SERVER['HTTP_SURROGATE_CAPABILITY'])
        && preg_match('/^(.+)\=ESI\/1\.0$/',$_SERVER['HTTP_SURROGATE_CAPABILITY'])
    ){
        header("Surrogate-Control: content='ESI/1.0'");
        return "<esi:include src=\"{$url}\" />";
    } else {
        return "<strong>ESI not rendered for URL {$url}</strong>";
    }
}
?>
<h1>Exercise 12</h1>
<h2>Edge Side Includes</h2>
<?php
echo date("Y-m-d H:i:s").'<br/>';
echo esi('edge.php?ttl=2s').'<br/>';
echo esi('edge.php?ttl=0s').'<br/>';
?>
<br /><a href="/">Back to index</a>