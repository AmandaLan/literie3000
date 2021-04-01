<?php
if (isset($_GET["id"])) {

    // Connexion à la base movieshuffle
    $dsn = "mysql:host=localhost;dbname=movieshuffle";
    $db = new PDO($dsn, "root", "");

    // $query = $db->prepare("SELECT * FROM movies WHERE id = :id");

    $query->bindParam(":id", $_GET["id"], PDO::PARAM_INT);
    $query->execute();
    $matela = $query->fetch();


    if ($matela) {
        $find = true;

        $data = $matela;
    }
}

include("tpl/header.php");
?>

<?php
if ($find) {
?>
    <div>
        <img src="<?= $data["image"] ?>" alt="">
    </div>
    <div>
        <p><?= $data["marque"] ?></p>
        <p><?= $data["nom"] ?></p>
        <p><?= $data["dimensions"] ?></p>
        <p><?= $data["prix"] ?></p>
        <p><?= $data["reduction"] ?></p>
    </div>
<?php
}
?>