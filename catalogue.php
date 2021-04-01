<?php

$dsn = "mysql:host=localhost;dbname=literie3000";
$db = new PDO($dsn, "root", "");

$query = $db->query("SELECT * FROM matelas");

$matelas = $query->fetchAll();

$query = $db->prepare("DELETE FROM matelas WHERE matelas.id = :id ");
$query->bindValue(":id", 6, PDO::PARAM_INT);
$query->execute();

// if (isset($_GET["id"])) {
//     $dsn = "mysql:host=localhost;dbname=literie3000";
//     $db = new PDO($dsn, "root", "");

//     $query = $db->prepare("SELECT *, GROUP_CONCAT( dimensions.mesure SEPARATOR '-' ) AS dimensions
//     FROM matelas
//     INNER JOIN matelas_dimensions
//     ON matelas.id = matelas_dimensions.matela_id
//     INNER JOIN dimensions
//     ON matelas_dimensions.dimension_id = dimensions.id
//     WHERE matelas.id = :id");

//     $query->bindParam(":id", $_GET["id"], PDO::PARAM_INT);
//     $query->execute();
//     $matelas = $query->fetch();


//     if ($matelas) {
//         $find = true;

//         $data = $matelas;
//     }
// }

?>

<main>

    <!-- <div class="container">
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
    </div> -->

    <div class="container">
        <?php
        foreach ($matelas as $matela) {
        ?>
            <div>
                <img src="<?= $matela["image"] ?>" alt="">
            </div>
            <div>
                <p><?= $matela["marque"] ?></p>
                <p><?= $matela["nom"] ?></p>
                <p><?= $matela["prix"] ?></p>
                <p><?= $matela["reduction"] ?></p>

                <input class="btn-suppMatelas" type="submit" value="Supprimer">
                <input class="btn-updateMatelas" type="submit" value="Modifier">

            </div>
        <?php
        }
        ?>
    </div>
</main>