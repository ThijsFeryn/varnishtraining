<?php
header('Cache-control: public, s-maxage=10');
if(isset($_SERVER['HTTP_X_LOGIN'])){
    header('Vary: X-Login');
    if($_SERVER['HTTP_X_LOGIN'] == 'true') {
        echo "<ul><li>Logged in as <em id='username'></em>".PHP_EOL;
    } else {
        echo "<ul><li>Not logged in".PHP_EOL;
    }
} else {
    echo "<ul><li>Not logged in".PHP_EOL;
}
echo "<li>".date('Y-m-d H:i:s')."</li>".PHP_EOL;
echo "<li>X-Login value: ".$_SERVER['HTTP_X_LOGIN']. "</li></ul>".PHP_EOL;
?>
<script
    src="https://code.jquery.com/jquery-3.2.1.min.js"
    integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
    crossorigin="anonymous"></script>
<script
    src="https://cdn.rawgit.com/js-cookie/js-cookie/master/src/js.cookie.js"
    crossorigin="anonymous"></script>
<script language="JavaScript"> 
function getCookie(name) { 
    var value = "; " + document.cookie; 
    var parts = value.split("; " + name + "="); 
    if (parts.length == 2) {
        return parts.pop().split(";").shift();
    } 
} 
function parseJwt (token) { 
    var base64Url = token.split('.')[1]; 
    var base64 = base64Url.replace('-', '+').replace('_', '/'); 
    return JSON.parse(window.atob(base64)); 
}; 
$(document).ready(function(){ 
    if (Cookies.get('jwt_cookie') != null ){ 
        var token = parseJwt(Cookies.get("jwt_cookie")); 
        $("#username").html(', ' + token.username); 
    } 
}); </script>
