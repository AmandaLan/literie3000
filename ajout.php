<?php
if (!empty($_POST)) {
    $marque = trim(strip_tags($_POST["marque"]));
    $nom = trim(strip_tags($_POST["nom"]));
    $prix = trim(strip_tags($_POST["prix"]));
    $reduction = trim(strip_tags($_POST["reduction"]));
    $image = trim(strip_tags($_POST["image"]));

    $errors = [];

    if (!filter_var($image, FILTER_VALIDATE_URL)) {
        $errors["image"] = "L'url de l'image est invalide";
    }

    if (empty($errors)) {

        $db = new PDO("mysql:host=localhost;dbname=literie3000", "root", "");
        $query = $db->prepare("INSERT INTO matelas (marque, nom, prix, reduction, image) VALUES (:marque, :nom, :prix, :reduction, :image)");
        $query->bindParam(":marque", $marque);
        $query->bindParam(":nom", $nom);
        $query->bindParam(":prix", $prix);
        $query->bindParam(":reduction", $reduction);
        $query->bindParam(":image", $image);

        if ($query->execute()) {
            header("Location: index.php");
        } else {
            $message = "<p class=\"error\">Un problème est survenu lors de l'ajout d'un matelas, veuillez réessayer !</p>";
        }
    }
}

include('tpl/header.php');

?>

<h1 class="form-titre">Ajouter un matelas</h1>

<form action="" method="post">

    <div class="form-image">
        <label for="inputImage">Image en url du matelas :</label>
        <input type="text" name="image" id="inputImage" value="<?= isset($image) ? $image : "" ?>">
        <?php echo isset($errors["image"]) ? "<p class=\"error\">{$errors["image"]}</p>" : "" ?>
    </div>
    <div class="form">
        <div class="form-group">
            <div class="form-group">
                <label for="inputMarque">Marque du matelas :</label>
                <input type="text" name="marque" id="inputMarque" value="<?= isset($marque) ? $marque : "" ?>">
                <?php echo isset($errors["marque"]) ? "<p class=\"error\">{$errors["marque"]}</p>" : "" ?>

            </div>
            <div class="form-group">
                <label for="inputNom">Nom du matelas :</label>
                <input type="text" name="nom" id="inputNom" value="<?= isset($nom) ? $nom : "" ?>">
                <?php echo isset($errors["nom"]) ? "<p class=\"error\">{$errors["nom"]}</p>" : "" ?>

            </div>
            <div class="form-group">
                <label for="inputPrix">Prix du matelas :</label>
                <input type="text" name="prix" id="inputPrix" value="<?= isset($prix) ? $prix : "" ?>">
                <?php echo isset($errors["prix"]) ? "<p class=\"error\">{$errors["prix"]}</p>" : "" ?>

            </div>
            <div class="form-group">
                <label for="inputReduction">Reduction du matelas :</label>
                <input type="text" name="reduction" id="inputReduction" value="<?= isset($reduction) ? $reduction : "" ?>">
                <?php echo isset($errors["reduction"]) ? "<p class=\"error\">{$errors["reduction"]}</p>" : "" ?>

            </div>
        </div>
        <div class="btn-addMatelas">
            <input  type="submit" value="Ajouter le matelas">

        </div>
    </div>



</form>

<?php
include('tpl/footer.php');
?>