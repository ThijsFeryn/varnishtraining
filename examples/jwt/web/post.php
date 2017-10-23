<?php
use Lcobucci\JWT\Builder;
use Lcobucci\JWT\Signer\Hmac\Sha256;
require dirname(__DIR__) . '/vendor/autoload.php';
header('Cache-control: public, s-maxage=10');
$key = file_get_contents(dirname(__DIR__).'/jwt.key');
if(isset($_POST['username'])) {
    $token = (new Builder())->setIssuer("http://{$_SERVER['HTTP_HOST']}/") // Configures the issuer (iss claim)
    ->setIssuedAt(time()) // Configures the time that the token was issue (iat claim)
    ->setExpiration(time() + 3600) // Configures the expiration time of the token (exp claim)
    ->set('uid', 1) // Configures a new claim, called "uid"
    ->set('username',$_POST['username']) //Custom claim
    ->sign(new Sha256(),$key) //The HMAC SHA256 signing based on the secret key
    ->getToken(); // Retrieves the generated token
    setcookie('jwt_cookie',$token);
    header("HTTP/1.1 302 Moved");
    header("Location: /");
    exit;
}
?>
<form method="post">
    <h1>Login</h1>
    <ul>
        <li>Username: <input type="text" name="username" /></li>
        <li><input type="submit" value="Login"/></li>
        <li><?php echo date('Y-m-d H:i:s'); ?></li>
        <li>X-Login value: <?php echo $_SERVER['HTTP_X_LOGIN']; ?></li>
        <li>Signing key: <?php echo $key; ?></li>
    </ul>
</form>
