<?php

$dsn = "mysql:host=localhost;dbname=literie3000";
$db = new PDO($dsn, "root", "");

$query = $db->query("SELECT * FROM matelas");

$matelas = $query->fetchAll();

$query = $db->prepare("DELETE FROM matelas WHERE matelas.id = :id ");
$query->bindValue(":id", 6, PDO::PARAM_INT);
$query->execute();

include('tpl/header.php');

?>

<main>



    <div class="catalogue container">
        <?php
        foreach ($matelas as $matela) {
        ?>
            <div class="imgCatalogue">
                <img src="<?= $matela["image"] ?>" alt="">
            </div>
            <div class="infoCatalogue">
                <h2><?= $matela["marque"] ?></h2>
                <h4><?= $matela["nom"] ?></h4>
                <p class="barre"><?= $matela["prix"] ?>,00€</p>
                <h5>Promo : <?= $matela["reduction"] ?>,00€</h5>
                <div class="inputCatalogue">
                    <a class="btn-suppMatelas" href="" value="Supprimer">Supprimer</a>
                    <a class="btn-updateMatelas" href="" value="Modifier">Modifier</a>
                </div>
            </div>

        <?php
        }
        ?>
    </div>
</main>

<?php 
include('tpl/footer.php');
?>