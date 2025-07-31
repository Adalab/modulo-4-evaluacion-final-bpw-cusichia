-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: simpsons_db
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `capitulos`
--

DROP TABLE IF EXISTS `capitulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `numero_episodio` int DEFAULT NULL,
  `temporada` int DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `sinopsis` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulos`
--

LOCK TABLES `capitulos` WRITE;
/*!40000 ALTER TABLE `capitulos` DISABLE KEYS */;
INSERT INTO `capitulos` VALUES (1,'Bart el genio',2,1,'1990-01-14','Bart hace trampa en un test y lo confunden con un genio.'),(2,'Marge contra el monorriel',12,4,'1993-01-14','La ciudad compra un monorriel inútil y Homero se vuelve conductor.'),(3,'Lisa la vegetariana',5,7,'1995-10-15','Lisa decide dejar de comer carne y enfrenta conflictos en casa.'),(4,'Homero el Grande',12,6,'1995-01-08','Homero entra a una sociedad secreta llamada Los Magios.'),(5,'Homer Defined',5,3,'1991-11-01','Homero evita una fusión nuclear por accidente y se vuelve un héroe.'),(6,'Rosebud',4,5,'1993-10-21','Mr. Burns busca recuperar su oso de peluche perdido.'),(7,'Bart the General',5,1,'1990-02-04','Bart organiza una guerra contra Nelson el abusón.'),(8,'Homer Goes to College',3,5,'1993-10-14','Homero vuelve a la universidad para conservar su empleo.'),(9,'Bart Gets Famous',12,5,'1994-02-03','Bart se vuelve famoso al decir \'¡Yo no fui!\' en un programa de televisión.'),(10,'Homer Loves Flanders',16,5,'1994-03-17','Homero se obsesiona con hacerse amigo de Ned Flanders.'),(11,'Radioactive Man',2,7,'1995-09-24','Se filma una película de Radioactive Man en Springfield.'),(12,'Homer the Heretic',3,4,'1992-10-08','Homero decide no ir más a misa y crea su propia religión casera.');
/*!40000 ALTER TABLE `capitulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frases`
--

DROP TABLE IF EXISTS `frases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` varchar(255) NOT NULL,
  `marca_tiempo` varchar(5) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases`
--

LOCK TABLES `frases` WRITE;
/*!40000 ALTER TABLE `frases` DISABLE KEYS */;
INSERT INTO `frases` VALUES (1,'¡D\'oh!','01:10','Frase clásica de Homero al cometer errores. Aparece en muchos episodios.'),(2,'Excelente...','05:23','Mr. Burns la dice cuando algo malvado le sale bien.'),(3,'¡Ay, caramba!','00:50','Frase icónica de Bart. Aparece por primera vez en el episodio \'Bart el genio\'.'),(4,'Lisa necesita frenos','03:02','Homero lo canta sin querer en \'Marge contra el monorriel\'.'),(5,'No vives de ensalada','07:40','Parte de una canción que canta Lisa en \'Lisa la vegetariana\'.'),(6,'¡Multiplícate por cero!','02:45','Una de las frases más insolentes de Bart.'),(7,'¡Me quiero volver chango!','09:30','Frase desesperada de Homero usada en varias ocasiones.'),(8,'¿Por qué a mí? ¡Yo soy normal!','04:40','Frase típica de Milhouse al sentirse excluido.'),(9,'No estaba dormido, estaba pensando','11:12','Homero se justifica en el trabajo cuando lo descubren dormido.'),(10,'¡Yo no fui!','00:55','Frase usada por Bart cuando lo acusan de algo.'),(11,'Lisa, en esta casa obedecemos las leyes de la termodinámica','14:10','Homero intentando convencer a Lisa con ciencia mal aplicada.'),(12,'¡Es el fin del mundo tal como lo conocemos!','06:20','Homero lo grita durante una crisis en Springfield.'),(13,'¡Yo no fui! 2','00:55','Frase usada por Bart cuando lo acusan de algo.');
/*!40000 ALTER TABLE `frases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frases_capitulos_personajes`
--

DROP TABLE IF EXISTS `frases_capitulos_personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frases_capitulos_personajes` (
  `frases_id` int NOT NULL,
  `capitulos_id` int NOT NULL,
  `personajes_id` int NOT NULL,
  PRIMARY KEY (`frases_id`,`capitulos_id`,`personajes_id`),
  KEY `fk_frases_has_capitulos_capitulos1_idx` (`capitulos_id`),
  KEY `fk_frases_has_capitulos_frases1_idx` (`frases_id`),
  KEY `fk_frases_has_capitulos_personajes1_idx` (`personajes_id`),
  CONSTRAINT `fk_frases_has_capitulos_capitulos1` FOREIGN KEY (`capitulos_id`) REFERENCES `capitulos` (`id`),
  CONSTRAINT `fk_frases_has_capitulos_frases1` FOREIGN KEY (`frases_id`) REFERENCES `frases` (`id`),
  CONSTRAINT `fk_frases_has_capitulos_personajes1` FOREIGN KEY (`personajes_id`) REFERENCES `personajes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frases_capitulos_personajes`
--

LOCK TABLES `frases_capitulos_personajes` WRITE;
/*!40000 ALTER TABLE `frases_capitulos_personajes` DISABLE KEYS */;
INSERT INTO `frases_capitulos_personajes` VALUES (1,1,1),(2,2,4),(3,3,2),(4,4,1),(5,5,3),(6,6,2),(7,7,1),(8,8,5),(9,9,1),(13,9,2),(10,10,2),(11,11,1),(12,12,1);
/*!40000 ALTER TABLE `frases_capitulos_personajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personajes`
--

DROP TABLE IF EXISTS `personajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personajes`
--

LOCK TABLES `personajes` WRITE;
/*!40000 ALTER TABLE `personajes` DISABLE KEYS */;
INSERT INTO `personajes` VALUES (1,'Homer','Simpson','Inspector de seguridad en la planta nuclear','Padre perezoso, fanático de la cerveza, pero con buen corazón.'),(2,'Bart','Simpson','Estudiante','Travieso, rebelde, siempre buscando problemas.'),(3,'Lisa','Simpson','Estudiante','Inteligente, crítica y apasionada por el medioambiente.'),(4,'Mr.','Burns','Dueño de la planta nuclear','Anciano millonario, déspota y siempre conspirando.'),(5,'Milhouse','Van Houten','Estudiante','Mejor amigo de Bart, inseguro pero leal.');
/*!40000 ALTER TABLE `personajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 19:58:15
