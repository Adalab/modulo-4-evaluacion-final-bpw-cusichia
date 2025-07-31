-- CREACIÓN TABLAS E INFO DB 
CREATE DATABASE simpsons_db;

CREATE TABLE frases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(255) NOT NULL,
    marca_tiempo VARCHAR(5),
    descripcion TEXT
);

CREATE TABLE personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    ocupacion VARCHAR(100),
    descripcion TEXT
);


CREATE TABLE capitulos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    numero_episodio INT,
    temporada INT,
    fecha_emision DATE,
    sinopsis TEXT
);

INSERT INTO frases (texto, marca_tiempo, descripcion) VALUES
("¡D'oh!", "01:10", "Frase clásica de Homero al cometer errores. Aparece en muchos episodios."),
("Excelente...", "05:23", "Mr. Burns la dice cuando algo malvado le sale bien."),
("¡Ay, caramba!", "00:50", "Frase icónica de Bart. Aparece por primera vez en el episodio 'Bart el genio'."),
("Lisa necesita frenos", "03:02", "Homero lo canta sin querer en 'Marge contra el monorriel'."),
("No vives de ensalada", "07:40", "Parte de una canción que canta Lisa en 'Lisa la vegetariana'."),
("¡Multiplícate por cero!", "02:45", "Una de las frases más insolentes de Bart."),
("¡Me quiero volver chango!", "09:30", "Frase desesperada de Homero usada en varias ocasiones."),
("¿Por qué a mí? ¡Yo soy normal!", "04:40", "Frase típica de Milhouse al sentirse excluido."),
("No estaba dormido, estaba pensando", "11:12", "Homero se justifica en el trabajo cuando lo descubren dormido."),
("¡Yo no fui!", "00:55", "Frase usada por Bart cuando lo acusan de algo."),
("Lisa, en esta casa obedecemos las leyes de la termodinámica", "14:10", "Homero intentando convencer a Lisa con ciencia mal aplicada."),
("¡Es el fin del mundo tal como lo conocemos!", "06:20", "Homero lo grita durante una crisis en Springfield.");


INSERT INTO personajes (nombre, apellido, ocupacion, descripcion) VALUES
("Homer", "Simpson", "Inspector de seguridad en la planta nuclear", "Padre perezoso, fanático de la cerveza, pero con buen corazón."),
("Bart", "Simpson", "Estudiante", "Travieso, rebelde, siempre buscando problemas."),
("Lisa", "Simpson", "Estudiante", "Inteligente, crítica y apasionada por el medioambiente."),
("Mr.", "Burns", "Dueño de la planta nuclear", "Anciano millonario, déspota y siempre conspirando."),
("Milhouse", "Van Houten", "Estudiante", "Mejor amigo de Bart, inseguro pero leal.");

INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis) VALUES
("Bart el genio", 2, 1, '1990-01-14', "Bart hace trampa en un test y lo confunden con un genio."),
("Marge contra el monorriel", 12, 4, '1993-01-14', "La ciudad compra un monorriel inútil y Homero se vuelve conductor."),
("Lisa la vegetariana", 5, 7, '1995-10-15', "Lisa decide dejar de comer carne y enfrenta conflictos en casa."),
("Homero el Grande", 12, 6, '1995-01-08', "Homero entra a una sociedad secreta llamada Los Magios.");
INSERT INTO capitulos (titulo, numero_episodio, temporada, fecha_emision, sinopsis) VALUES
("Homer Defined", 5, 3, '1991-11-01', "Homero evita una fusión nuclear por accidente y se vuelve un héroe."), -- ¡D'oh!
("Rosebud", 4, 5, '1993-10-21', "Mr. Burns busca recuperar su oso de peluche perdido."), -- Excelente...
("Bart the General", 5, 1, '1990-02-04', "Bart organiza una guerra contra Nelson el abusón."), -- ¡Multiplícate por cero!
("Homer Goes to College", 3, 5, '1993-10-14', "Homero vuelve a la universidad para conservar su empleo."), -- No estaba dormido, estaba pensando
("Bart Gets Famous", 12, 5, '1994-02-03', "Bart se vuelve famoso al decir '¡Yo no fui!' en un programa de televisión."), -- ¡Yo no fui!
("Homer Loves Flanders", 16, 5, '1994-03-17', "Homero se obsesiona con hacerse amigo de Ned Flanders."), -- ¡Me quiero volver chango!
("Radioactive Man", 2, 7, '1995-09-24', "Se filma una película de Radioactive Man en Springfield."), -- ¿Por qué a mí? ¡Yo soy normal!
("Homer the Heretic", 3, 4, '1992-10-08', "Homero decide no ir más a misa y crea su propia religión casera."); -- ¡Es el fin del mundo...!




-- CREACIÓN RELACIONES SIMPSONS_DB

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema simpsons_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema simpsons_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `simpsons_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `simpsons_db` ;

-- -----------------------------------------------------
-- Table `simpsons_db`.`capitulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simpsons_db`.`capitulos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL DEFAULT NULL,
  `numero_episodio` INT NULL DEFAULT NULL,
  `temporada` INT NULL DEFAULT NULL,
  `fecha_emision` DATE NULL DEFAULT NULL,
  `sinopsis` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simpsons_db`.`personajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simpsons_db`.`personajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellido` VARCHAR(50) NULL DEFAULT NULL,
  `ocupacion` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simpsons_db`.`frases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simpsons_db`.`frases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(255) NOT NULL,
  `marca_tiempo` VARCHAR(5) NULL DEFAULT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `personajes_id` INT NOT NULL,
  PRIMARY KEY (`id`, `personajes_id`),
  INDEX `fk_frases_personajes_idx` (`personajes_id` ASC) VISIBLE,
  CONSTRAINT `fk_frases_personajes`
    FOREIGN KEY (`personajes_id`)
    REFERENCES `simpsons_db`.`personajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `simpsons_db`.`personajes_has_capitulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `simpsons_db`.`personajes_has_capitulos` (
  `personajes_id` INT NOT NULL,
  `capitulos_id` INT NOT NULL,
  PRIMARY KEY (`personajes_id`, `capitulos_id`),
  INDEX `fk_personajes_has_capitulos_capitulos1_idx` (`capitulos_id` ASC) VISIBLE,
  INDEX `fk_personajes_has_capitulos_personajes1_idx` (`personajes_id` ASC) VISIBLE,
  CONSTRAINT `fk_personajes_has_capitulos_personajes1`
    FOREIGN KEY (`personajes_id`)
    REFERENCES `simpsons_db`.`personajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_personajes_has_capitulos_capitulos1`
    FOREIGN KEY (`capitulos_id`)
    REFERENCES `simpsons_db`.`capitulos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

