<script type="text/javascript">
    var d=new Date();
    var dFull = d.getFullYear()+'-'+ d.getMonth()+'-'+ d.getDate()+' '+ d.getHours()+':'+ d.getMinutes()+':'+ d.getUTCSeconds();
    document.cookie="time="+dFull+"; path=/exercises/10/";
</script>
<h1>Exercise 10</h1>
<h2>Cache cookies</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
echo "Cookie detected: ".$_COOKIE['time'].'<br />';
?>
<a href="/">Back to index</a>