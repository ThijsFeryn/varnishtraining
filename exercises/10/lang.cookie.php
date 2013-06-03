<h1>Exercise 10</h1>
<h2>Caching the language cookie</h2>
<?php
echo 'Current date/time: '.date("Y-m-d H:i:s").'<br/>';
if(isset($_COOKIE['lang'])){
    echo "Language selected: ".$_COOKIE['lang'].'<br />';
} elseif(!isset($_POST['lang'])) {
?>
    <form method="POST">
        <fieldset>
            <legend>Select language</legend>
            <label>Language</label>
            <select name="lang">
                <option value="en">English</option>
                <option value="fr">French</option>
                <option value="nl">Dutch</option>
                <option value="de">German</option>
            </select>
            <br />
            <label>Select</label>
            <input type="submit" value="Select language"/>
            <br />
        </fieldset>
    </form>
<?php
} else {
    setcookie('lang',$_POST['lang']);
    header('Location: '.$_SERVER['PHP_SELF']);
}
?>
<a href="/">Back to index</a>