USE literie3000;

CREATE TABLE matelas (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    marque VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prix INT NOT NULL,
    reduction INT,
    image TEXT
);

CREATE TABLE dimensions (
    id TINYINT PRIMARY KEY AUTO_INCREMENT,
    mesure VARCHAR(50) NOT NULL
);

CREATE TABLE matelas_dimensions (
    matela_id TINYINT,
    dimension_id TINYINT,
    PRIMARY KEY (matela_id, dimension_id),
    FOREIGN KEY (matela_id) REFERENCES matelas(id),
    FOREIGN KEY (dimension_id) REFERENCES dimensions(id)
);


INSERT INTO matelas
(marque, nom, prix, reduction, image)

VALUES

("Epeda", "Matelas Tamoul", 759, 529, "https://www.leroidumatelas.fr/media/catalog/product/cache/1/thumbnail/9df78eab33525d08d6e5fb8d27136e95/h/e/heris_1.jpg"),

("Dreamway", "Matelas Waldorf", 809, 709, "https://www.leroidumatelas.fr/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/a/d/aden_cirse-deco-ashgrey_140x190_1.jpg"),

("Bultex", "Matelas Joris", 759, 529, "https://www.leroidumatelas.fr/media/catalog/product/cache/1/image/1800x/040ec09b1e35df139433887a97daa66f/M/A/MAT-MINT_01.jpg"),

("Epeda", "Matelas Melon", 1019, 509, "https://www.leroidumatelas.lu/media/catalog/product/cache/4/thumbnail/9df78eab33525d08d6e5fb8d27136e95/M/A/MAT-ACAJOU_01_9.jpg");

INSERT INTO dimensions
(mesure)
VALUES
("90x190"),
("140x190"),
("160x200"),
("180x200"),
("200x200");

INSERT INTO matelas_dimensions
(matela_id, dimension_id)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);


