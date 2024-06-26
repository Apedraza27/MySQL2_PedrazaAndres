-- #####################
-- ### DIA # 5 - SQL 2 ###
-- #####################

use `mysql2_dia5`;

-- Trigger para insertar o actualizar una ciudad en un pais con la nueva población
delimiter // 
create trigger after_city_insert_update
after insert on city
for each row
begin
	update country
    set population = population - old.population
	where code = old.countrycode;
end // 
delimiter ;

-- Test 
select * from city where name = "Artemis";
delete from city where ID=4080;

-- Crear tabla para auditoria de ciudad
create table if not exists city_audit(
	audit_id int auto_increment primary key,
    city_id int,
    action varchar(10),
    old_population int, 
    new_population int,
    change_time timestamp default current_timestamp
);

-- Trigger para auditoria de ciudades cuando se inserta
delimiter // 
create trigger after_city_insert_audit
after insert on city
for each row
begin
	insert into city_audit(city_id, action, new_population)
    values (new.id, 'insert', new.population);
end // 
delimiter ;

select * from city_audit;
insert into city(name, countrycode, district, population)
values ("Artemis", "AFG", "piso 6", 1250000);

-- Trigger para auditoria de ciudades cuando se inserta
delimiter // 
create trigger after_city_update_audit
after insert on city
for each row
begin
	insert into city_audit(city_id, action, old_population, new_population)
    values (old.id, 'update', old.population, new.population);
end // 
delimiter ;

-- Test
update city set population = 1550000 where ID=4081;
select * from city_audit;

-- EVENTOS

-- Creación de tabla para bk de ciudades
create table if not exists city_backup(
	id int not null, 
    name char(35) not null, 
    countrycode char(35) not null,
    district char(3) not null,
    population char(20) not null,
    primary key (id)
) Engine=InnoDB default charset=utf8mb4;

delimiter // 
create event if not exists weekly_city_backup
on schedule every 1 week
Do
begin
    truncate table city_backup;
    insert into city_backup(ID,Name,CountryCode,District,Population)
    select ID,Name,CountryCode,District,Population from city;
end //
delimiter ;









-- MySQL dump 10.13  Distrib 8.0.19, for osx10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: world
-- ------------------------------------------------------
-- Server version8.0.19-debug

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @old_autocommit=@@autocommit;

--
-- Current Database: `world`
--

/*!40000 DROP DATABASE IF EXISTS `world`*/;

CREATE DATABASE `world` DEFAULT CHARACTER SET utf8mb4;

USE `world`;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CountryCode` (`CountryCode`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--
-- ORDER BY:  `ID`

set autocommit=0;
INSERT INTO `city` VALUES (1,'Kabul','AFG','Kabol',1780000);
INSERT INTO `city` VALUES (2,'Qandahar','AFG','Qandahar',237500);
INSERT INTO `city` VALUES (3,'Herat','AFG','Herat',186800);
INSERT INTO `city` VALUES (4,'Mazar-e-Sharif','AFG','Balkh',127800);
INSERT INTO `city` VALUES (5,'Amsterdam','NLD','Noord-Holland',731200);
INSERT INTO `city` VALUES (6,'Rotterdam','NLD','Zuid-Holland',593321);
INSERT INTO `city` VALUES (7,'Haag','NLD','Zuid-Holland',440900);
INSERT INTO `city` VALUES (8,'Utrecht','NLD','Utrecht',234323);
INSERT INTO `city` VALUES (9,'Eindhoven','NLD','Noord-Brabant',201843);
INSERT INTO `city` VALUES (10,'Tilburg','NLD','Noord-Brabant',193238);
INSERT INTO `city` VALUES (11,'Groningen','NLD','Groningen',172701);
INSERT INTO `city` VALUES (12,'Breda','NLD','Noord-Brabant',160398);
INSERT INTO `city` VALUES (13,'Apeldoorn','NLD','Gelderland',153491);
INSERT INTO `city` VALUES (14,'Nijmegen','NLD','Gelderland',152463);
INSERT INTO `city` VALUES (15,'Enschede','NLD','Overijssel',149544);
INSERT INTO `city` VALUES (16,'Haarlem','NLD','Noord-Holland',148772);
INSERT INTO `city` VALUES (17,'Almere','NLD','Flevoland',142465);
INSERT INTO `city` VALUES (18,'Arnhem','NLD','Gelderland',138020);
INSERT INTO `city` VALUES (19,'Zaanstad','NLD','Noord-Holland',135621);
INSERT INTO `city` VALUES (20,'´s-Hertogenbosch','NLD','Noord-Brabant',129170);
INSERT INTO `city` VALUES (21,'Amersfoort','NLD','Utrecht',126270);
INSERT INTO `city` VALUES (22,'Maastricht','NLD','Limburg',122087);
INSERT INTO `city` VALUES (23,'Dordrecht','NLD','Zuid-Holland',119811);
INSERT INTO `city` VALUES (24,'Leiden','NLD','Zuid-Holland',117196);
INSERT INTO `city` VALUES (25,'Haarlemmermeer','NLD','Noord-Holland',110722);
INSERT INTO `city` VALUES (26,'Zoetermeer','NLD','Zuid-Holland',110214);
INSERT INTO `city` VALUES (27,'Emmen','NLD','Drenthe',105853);
INSERT INTO `city` VALUES (28,'Zwolle','NLD','Overijssel',105819);
INSERT INTO `city` VALUES (29,'Ede','NLD','Gelderland',101574);
INSERT INTO `city` VALUES (30,'Delft','NLD','Zuid-Holland',95268);
INSERT INTO `city` VALUES (31,'Heerlen','NLD','Limburg',95052);
INSERT INTO `city` VALUES (32,'Alkmaar','NLD','Noord-Holland',92713);
INSERT INTO `city` VALUES (33,'Willemstad','ANT','Curaçao',2345);
INSERT INTO `city` VALUES (34,'Tirana','ALB','Tirana',270000);
INSERT INTO `city` VALUES (35,'Alger','DZA','Alger',2168000);
INSERT INTO `city` VALUES (36,'Oran','DZA','Oran',609823);
INSERT INTO `city` VALUES (37,'Constantine','DZA','Constantine',443727);
INSERT INTO `city` VALUES (38,'Annaba','DZA','Annaba',222518);
INSERT INTO `city` VALUES (39,'Batna','DZA','Batna',183377);
INSERT INTO `city` VALUES (40,'Sétif','DZA','Sétif',179055);
INSERT INTO `city` VALUES (41,'Sidi Bel Abbès','DZA','Sidi Bel Abbès',153106);
INSERT INTO `city` VALUES (42,'Skikda','DZA','Skikda',128747);
INSERT INTO `city` VALUES (43,'Biskra','DZA','Biskra',128281);
INSERT INTO `city` VALUES (44,'Blida (el-Boulaida)','DZA','Blida',127284);
INSERT INTO `city` VALUES (45,'Béjaïa','DZA','Béjaïa',117162);
INSERT INTO `city` VALUES (46,'Mostaganem','DZA','Mostaganem',115212);
INSERT INTO `city` VALUES (47,'Tébessa','DZA','Tébessa',112007);
INSERT INTO `city` VALUES (48,'Tlemcen (Tilimsen)','DZA','Tlemcen',110242);
INSERT INTO `city` VALUES (49,'Béchar','DZA','Béchar',107311);
INSERT INTO `city` VALUES (50,'Tiaret','DZA','Tiaret',100118);
INSERT INTO `city` VALUES (51,'Ech-Chleff (el-Asnam)','DZA','Chlef',96794);
INSERT INTO `city` VALUES (52,'Ghardaïa','DZA','Ghardaïa',89415);
INSERT INTO `city` VALUES (53,'Tafuna','ASM','Tutuila',5200);
INSERT INTO `city` VALUES (54,'Fagatogo','ASM','Tutuila',2323);
INSERT INTO `city` VALUES (55,'Andorra la Vella','AND','Andorra la Vella',21189);
INSERT INTO `city` VALUES (56,'Luanda','AGO','Luanda',2022000);
INSERT INTO `city` VALUES (57,'Huambo','AGO','Huambo',163100);
INSERT INTO `city` VALUES (58,'Lobito','AGO','Benguela',130000);
INSERT INTO `city` VALUES (59,'Benguela','AGO','Benguela',128300);
INSERT INTO `city` VALUES (60,'Namibe','AGO','Namibe',118200);
INSERT INTO `city` VALUES (61,'South Hill','AIA','–',961);
INSERT INTO `city` VALUES (62,'The Valley','AIA','–',595);
INSERT INTO `city` VALUES (63,'Saint John´s','ATG','St John',24000);
INSERT INTO `city` VALUES (64,'Dubai','ARE','Dubai',669181);
INSERT INTO `city` VALUES (65,'Abu Dhabi','ARE','Abu Dhabi',398695);
INSERT INTO `city` VALUES (66,'Sharja','ARE','Sharja',320095);
INSERT INTO `city` VALUES (67,'al-Ayn','ARE','Abu Dhabi',225970);
INSERT INTO `city` VALUES (68,'Ajman','ARE','Ajman',114395);
INSERT INTO `city` VALUES (69,'Buenos Aires','ARG','Distrito Federal',2982146);
INSERT INTO `city` VALUES (70,'La Matanza','ARG','Buenos Aires',1266461);
INSERT INTO `city` VALUES (71,'Córdoba','ARG','Córdoba',1157507);
INSERT INTO `city` VALUES (72,'Rosario','ARG','Santa Fé',907718);
INSERT INTO `city` VALUES (73,'Lomas de Zamora','ARG','Buenos Aires',622013);
INSERT INTO `city` VALUES (74,'Quilmes','ARG','Buenos Aires',559249);
INSERT INTO `city` VALUES (75,'Almirante Brown','ARG','Buenos Aires',538918);
INSERT INTO `city` VALUES (76,'La Plata','ARG','Buenos Aires',521936);
INSERT INTO `city` VALUES (77,'Mar del Plata','ARG','Buenos Aires',512880);
INSERT INTO `city` VALUES (78,'San Miguel de Tucumán','ARG','Tucumán',470809);
INSERT INTO `city` VALUES (79,'Lanús','ARG','Buenos Aires',469735);
INSERT INTO `city` VALUES (80,'Merlo','ARG','Buenos Aires',463846);
INSERT INTO `city` VALUES (81,'General San Martín','ARG','Buenos Aires',422542);
INSERT INTO `city` VALUES (82,'Salta','ARG','Salta',367550);
INSERT INTO `city` VALUES (83,'Moreno','ARG','Buenos Aires',356993);
INSERT INTO `city` VALUES (84,'Santa Fé','ARG','Santa Fé',353063);
INSERT INTO `city` VALUES (85,'Avellaneda','ARG','Buenos Aires',353046);
INSERT INTO `city` VALUES (86,'Tres de Febrero','ARG','Buenos Aires',352311);
INSERT INTO `city` VALUES (87,'Morón','ARG','Buenos Aires',349246);
INSERT INTO `city` VALUES (88,'Florencio Varela','ARG','Buenos Aires',315432);
INSERT INTO `city` VALUES (89,'San Isidro','ARG','Buenos Aires',306341);
INSERT INTO `city` VALUES (90,'Tigre','ARG','Buenos Aires',296226);
INSERT INTO `city` VALUES (91,'Malvinas Argentinas','ARG','Buenos Aires',290335);
INSERT INTO `city` VALUES (92,'Vicente López','ARG','Buenos Aires',288341);
INSERT INTO `city` VALUES (93,'Berazategui','ARG','Buenos Aires',276916);
INSERT INTO `city` VALUES (94,'Corrientes','ARG','Corrientes',258103);
INSERT INTO `city` VALUES (95,'San Miguel','ARG','Buenos Aires',248700);
INSERT INTO `city` VALUES (96,'Bahía Blanca','ARG','Buenos Aires',239810);
INSERT INTO `city` VALUES (97,'Esteban Echeverría','ARG','Buenos Aires',235760);
INSERT INTO `city` VALUES (98,'Resistencia','ARG','Chaco',229212);
INSERT INTO `city` VALUES (99,'José C. Paz','ARG','Buenos Aires',221754);
INSERT INTO `city` VALUES (100,'Paraná','ARG','Entre Rios',207041);
INSERT INTO `city` VALUES (101,'Godoy Cruz','ARG','Mendoza',206998);
INSERT INTO `city` VALUES (102,'Posadas','ARG','Misiones',201273);
INSERT INTO `city` VALUES (103,'Guaymallén','ARG','Mendoza',200595);
INSERT INTO `city` VALUES (104,'Santiago del Estero','ARG','Santiago del Estero',189947);
INSERT INTO `city` VALUES (105,'San Salvador de Jujuy','ARG','Jujuy',178748);
INSERT INTO `city` VALUES (106,'Hurlingham','ARG','Buenos Aires',170028);
INSERT INTO `city` VALUES (107,'Neuquén','ARG','Neuquén',167296);
INSERT INTO `city` VALUES (108,'Ituzaingó','ARG','Buenos Aires',158197);
INSERT INTO `city` VALUES (109,'San Fernando','ARG','Buenos Aires',153036);
INSERT INTO `city` VALUES (110,'Formosa','ARG','Formosa',147636);
INSERT INTO `city` VALUES (111,'Las Heras','ARG','Mendoza',145823);
INSERT INTO `city` VALUES (112,'La Rioja','ARG','La Rioja',138117);
INSERT INTO `city` VALUES (113,'San Fernando del Valle de Cata','ARG','Catamarca',134935);
INSERT INTO `city` VALUES (114,'Río Cuarto','ARG','Córdoba',134355);
INSERT INTO `city` VALUES (115,'Comodoro Rivadavia','ARG','Chubut',124104);
INSERT INTO `city` VALUES (116,'Mendoza','ARG','Mendoza',123027);
INSERT INTO `city` VALUES (117,'San Nicolás de los Arroyos','ARG','Buenos Aires',119302);
INSERT INTO `city` VALUES (118,'San Juan','ARG','San Juan',119152);
INSERT INTO `city` VALUES (119,'Escobar','ARG','Buenos Aires',116675);
INSERT INTO `city` VALUES (120,'Concordia','ARG','Entre Rios',116485);
INSERT INTO `city` VALUES (121,'Pilar','ARG','Buenos Aires',113428);
INSERT INTO `city` VALUES (122,'San Luis','ARG','San Luis',110136);
INSERT INTO `city` VALUES (123,'Ezeiza','ARG','Buenos Aires',99578);
INSERT INTO `city` VALUES (124,'San Rafael','ARG','Mendoza',94651);
INSERT INTO `city` VALUES (125,'Tandil','ARG','Buenos Aires',91101);
INSERT INTO `city` VALUES (126,'Yerevan','ARM','Yerevan',1248700);
INSERT INTO `city` VALUES (127,'Gjumri','ARM','Širak',211700);
INSERT INTO `city` VALUES (128,'Vanadzor','ARM','Lori',172700);
INSERT INTO `city` VALUES (129,'Oranjestad','ABW','–',29034);
INSERT INTO `city` VALUES (130,'Sydney','AUS','New South Wales',3276207);
INSERT INTO `city` VALUES (131,'Melbourne','AUS','Victoria',2865329);
INSERT INTO `city` VALUES (132,'Brisbane','AUS','Queensland',1291117);
INSERT INTO `city` VALUES (133,'Perth','AUS','West Australia',1096829);
INSERT INTO `city` VALUES (134,'Adelaide','AUS','South Australia',978100);
INSERT INTO `city` VALUES (135,'Canberra','AUS','Capital Region',322723);
INSERT INTO `city` VALUES (136,'Gold Coast','AUS','Queensland',311932);
INSERT INTO `city` VALUES (137,'Newcastle','AUS','New South Wales',270324);
INSERT INTO `city` VALUES (138,'Central Coast','AUS','New South Wales',227657);
INSERT INTO `city` VALUES (139,'Wollongong','AUS','New South Wales',219761);
INSERT INTO `city` VALUES (140,'Hobart','AUS','Tasmania',126118);
INSERT INTO `city` VALUES (141,'Geelong','AUS','Victoria',125382);
INSERT INTO `city` VALUES (142,'Townsville','AUS','Queensland',109914);
INSERT INTO `city` VALUES (143,'Cairns','AUS','Queensland',92273);
INSERT INTO `city` VALUES (144,'Baku','AZE','Baki',1787800);
INSERT INTO `city` VALUES (145,'Gäncä','AZE','Gäncä',299300);
INSERT INTO `city` VALUES (146,'Sumqayit','AZE','Sumqayit',283000);
INSERT INTO `city` VALUES (147,'Mingäçevir','AZE','Mingäçevir',93900);
INSERT INTO `city` VALUES (148,'Nassau','BHS','New Providence',172000);
INSERT INTO `city` VALUES (149,'al-Manama','BHR','al-Manama',148000);
INSERT INTO `city` VALUES (150,'Dhaka','BGD','Dhaka',3612850);
INSERT INTO `city` VALUES (151,'Chittagong','BGD','Chittagong',1392860);
INSERT INTO `city` VALUES (152,'Khulna','BGD','Khulna',663340);
INSERT INTO `city` VALUES (153,'Rajshahi','BGD','Rajshahi',294056);
INSERT INTO `city` VALUES (154,'Narayanganj','BGD','Dhaka',202134);
INSERT INTO `city` VALUES (155,'Rangpur','BGD','Rajshahi',191398);
INSERT INTO `city` VALUES (156,'Mymensingh','BGD','Dhaka',188713);
INSERT INTO `city` VALUES (157,'Barisal','BGD','Barisal',170232);
INSERT INTO `city` VALUES (158,'Tungi','BGD','Dhaka',168702);
INSERT INTO `city` VALUES (159,'Jessore','BGD','Khulna',139710);
INSERT INTO `city` VALUES (160,'Comilla','BGD','Chittagong',135313);
INSERT INTO `city` VALUES (161,'Nawabganj','BGD','Rajshahi',130577);
INSERT INTO `city` VALUES (162,'Dinajpur','BGD','Rajshahi',127815);
INSERT INTO `city` VALUES (163,'Bogra','BGD','Rajshahi',120170);
INSERT INTO `city` VALUES (164,'Sylhet','BGD','Sylhet',117396);
INSERT INTO `city` VALUES (165,'Brahmanbaria','BGD','Chittagong',109032);
INSERT INTO `city` VALUES (166,'Tangail','BGD','Dhaka',106004);
INSERT INTO `city` VALUES (167,'Jamalpur','BGD','Dhaka',103556);
INSERT INTO `city` VALUES (168,'Pabna','BGD','Rajshahi',103277);
INSERT INTO `city` VALUES (169,'Naogaon','BGD','Rajshahi',101266);
INSERT INTO `city` VALUES (170,'Sirajganj','BGD','Rajshahi',99669);
INSERT INTO `city` VALUES (171,'Narsinghdi','BGD','Dhaka',98342);
INSERT INTO `city` VALUES (172,'Saidpur','BGD','Rajshahi',96777);
INSERT INTO `city` VALUES (173,'Gazipur','BGD','Dhaka',96717);
INSERT INTO `city` VALUES (174,'Bridgetown','BRB','St Michael',6070);
INSERT INTO `city` VALUES (175,'Antwerpen','BEL','Antwerpen',446525);
INSERT INTO `city` VALUES (176,'Gent','BEL','East Flanderi',224180);
INSERT INTO `city` VALUES (177,'Charleroi','BEL','Hainaut',200827);
INSERT INTO `city` VALUES (178,'Liège','BEL','Liège',185639);
INSERT INTO `city` VALUES (179,'Bruxelles [Brussel]','BEL','Bryssel',133859);
INSERT INTO `city` VALUES (180,'Brugge','BEL','West Flanderi',116246);
INSERT INTO `city` VALUES (181,'Schaerbeek','BEL','Bryssel',105692);
INSERT INTO `city` VALUES (182,'Namur','BEL','Namur',105419);
INSERT INTO `city` VALUES (183,'Mons','BEL','Hainaut',90935);
INSERT INTO `city` VALUES (184,'Belize City','BLZ','Belize City',55810);
INSERT INTO `city` VALUES (185,'Belmopan','BLZ','Cayo',7105);
INSERT INTO `city` VALUES (186,'Cotonou','BEN','Atlantique',536827);
INSERT INTO `city` VALUES (187,'Porto-Novo','BEN','Ouémé',194000);
INSERT INTO `city` VALUES (188,'Djougou','BEN','Atacora',134099);
INSERT INTO `city` VALUES (189,'Parakou','BEN','Borgou',103577);
INSERT INTO `city` VALUES (190,'Saint George','BMU','Saint George´s',1800);
INSERT INTO `city` VALUES (191,'Hamilton','BMU','Hamilton',1200);
INSERT INTO `city` VALUES (192,'Thimphu','BTN','Thimphu',22000);
INSERT INTO `city` VALUES (193,'Santa Cruz de la Sierra','BOL','Santa Cruz',935361);
INSERT INTO `city` VALUES (194,'La Paz','BOL','La Paz',758141);
INSERT INTO `city` VALUES (195,'El Alto','BOL','La Paz',534466);
INSERT INTO `city` VALUES (196,'Cochabamba','BOL','Cochabamba',482800);
INSERT INTO `city` VALUES (197,'Oruro','BOL','Oruro',223553);
INSERT INTO `city` VALUES (198,'Sucre','BOL','Chuquisaca',178426);
INSERT INTO `city` VALUES (199,'Potosí','BOL','Potosí',140642);
INSERT INTO `city` VALUES (200,'Tarija','BOL','Tarija',125255);
INSERT INTO `city` VALUES (201,'Sarajevo','BIH','Federaatio',360000);
INSERT INTO `city` VALUES (202,'Banja Luka','BIH','Republika Srpska',143079);
INSERT INTO `city` VALUES (203,'Zenica','BIH','Federaatio',96027);
INSERT INTO `city` VALUES (204,'Gaborone','BWA','Gaborone',213017);
INSERT INTO `city` VALUES (205,'Francistown','BWA','Francistown',101805);
INSERT INTO `city` VALUES (206,'São Paulo','BRA','São Paulo',9968485);
INSERT INTO `city` VALUES (207,'Rio de Janeiro','BRA','Rio de Janeiro',5598953);
INSERT INTO `city` VALUES (208,'Salvador','BRA','Bahia',2302832);
INSERT INTO `city` VALUES (209,'Belo Horizonte','BRA','Minas Gerais',2139125);
INSERT INTO `city` VALUES (210,'Fortaleza','BRA','Ceará',2097757);
INSERT INTO `city` VALUES (211,'Brasília','BRA','Distrito Federal',1969868);
INSERT INTO `city` VALUES (212,'Curitiba','BRA','Paraná',1584232);
INSERT INTO `city` VALUES (213,'Recife','BRA','Pernambuco',1378087);
INSERT INTO `city` VALUES (214,'Porto Alegre','BRA','Rio Grande do Sul',1314032);
INSERT INTO `city` VALUES (215,'Manaus','BRA','Amazonas',1255049);
INSERT INTO `city` VALUES (216,'Belém','BRA','Pará',1186926);
INSERT INTO `city` VALUES (217,'Guarulhos','BRA','São Paulo',1095874);
INSERT INTO `city` VALUES (218,'Goiânia','BRA','Goiás',1056330);
INSERT INTO `city` VALUES (219,'Campinas','BRA','São Paulo',950043);
INSERT INTO `city` VALUES (220,'São Gonçalo','BRA','Rio de Janeiro',869254);
INSERT INTO `city` VALUES (221,'Nova Iguaçu','BRA','Rio de Janeiro',862225);
INSERT INTO `city` VALUES (222,'São Luís','BRA','Maranhão',837588);
INSERT INTO `city` VALUES (223,'Maceió','BRA','Alagoas',786288);
INSERT INTO `city` VALUES (224,'Duque de Caxias','BRA','Rio de Janeiro',746758);
INSERT INTO `city` VALUES (225,'São Bernardo do Campo','BRA','São Paulo',723132);
INSERT INTO `city` VALUES (226,'Teresina','BRA','Piauí',691942);
INSERT INTO `city` VALUES (227,'Natal','BRA','Rio Grande do Norte',688955);
INSERT INTO `city` VALUES (228,'Osasco','BRA','São Paulo',659604);
INSERT INTO `city` VALUES (229,'Campo Grande','BRA','Mato Grosso do Sul',649593);
INSERT INTO `city` VALUES (230,'Santo André','BRA','São Paulo',630073);
INSERT INTO `city` VALUES (231,'João Pessoa','BRA','Paraíba',584029);
INSERT INTO `city` VALUES (232,'Jaboatão dos Guararapes','BRA','Pernambuco',558680);
INSERT INTO `city` VALUES (233,'Contagem','BRA','Minas Gerais',520801);
INSERT INTO `city` VALUES (234,'São José dos Campos','BRA','São Paulo',515553);
INSERT INTO `city` VALUES (235,'Uberlândia','BRA','Minas Gerais',487222);
INSERT INTO `city` VALUES (236,'Feira de Santana','BRA','Bahia',479992);
INSERT INTO `city` VALUES (237,'Ribeirão Preto','BRA','São Paulo',473276);
INSERT INTO `city` VALUES (238,'Sorocaba','BRA','São Paulo',466823);
INSERT INTO `city` VALUES (239,'Niterói','BRA','Rio de Janeiro',459884);
INSERT INTO `city` VALUES (240,'Cuiabá','BRA','Mato Grosso',453813);
INSERT INTO `city` VALUES (241,'Juiz de Fora','BRA','Minas Gerais',450288);
INSERT INTO `city` VALUES (242,'Aracaju','BRA','Sergipe',445555);
INSERT INTO `city` VALUES (243,'São João de Meriti','BRA','Rio de Janeiro',440052);
INSERT INTO `city` VALUES (244,'Londrina','BRA','Paraná',432257);
INSERT INTO `city` VALUES (245,'Joinville','BRA','Santa Catarina',428011);
INSERT INTO `city` VALUES (246,'Belford Roxo','BRA','Rio de Janeiro',425194);
INSERT INTO `city` VALUES (247,'Santos','BRA','São Paulo',408748);
INSERT INTO `city` VALUES (248,'Ananindeua','BRA','Pará',400940);
INSERT INTO `city` VALUES (249,'Campos dos Goytacazes','BRA','Rio de Janeiro',398418);
INSERT INTO `city` VALUES (250,'Mauá','BRA','São Paulo',375055);
INSERT INTO `city` VALUES (251,'Carapicuíba','BRA','São Paulo',357552);
INSERT INTO `city` VALUES (252,'Olinda','BRA','Pernambuco',354732);
INSERT INTO `city` VALUES (253,'Campina Grande','BRA','Paraíba',352497);
INSERT INTO `city` VALUES (254,'São José do Rio Preto','BRA','São Paulo',351944);
INSERT INTO `city` VALUES (255,'Caxias do Sul','BRA','Rio Grande do Sul',349581);
INSERT INTO `city` VALUES (256,'Moji das Cruzes','BRA','São Paulo',339194);
INSERT INTO `city` VALUES (257,'Diadema','BRA','São Paulo',335078);
INSERT INTO `city` VALUES (258,'Aparecida de Goiânia','BRA','Goiás',324662);
INSERT INTO `city` VALUES (259,'Piracicaba','BRA','São Paulo',319104);
INSERT INTO `city` VALUES (260,'Cariacica','BRA','Espírito Santo',319033);
INSERT INTO `city` VALUES (261,'Vila Velha','BRA','Espírito Santo',318758);
INSERT INTO `city` VALUES (262,'Pelotas','BRA','Rio Grande do Sul',315415);
INSERT INTO `city` VALUES (263,'Bauru','BRA','São Paulo',313670);
INSERT INTO `city` VALUES (264,'Porto Velho','BRA','Rondônia',309750);
INSERT INTO `city` VALUES (265,'Serra','BRA','Espírito Santo',302666);
INSERT INTO `city` VALUES (266,'Betim','BRA','Minas Gerais',302108);
INSERT INTO `city` VALUES (267,'Jundíaí','BRA','São Paulo',296127);
INSERT INTO `city` VALUES (268,'Canoas','BRA','Rio Grande do Sul',294125);
INSERT INTO `city` VALUES (269,'Franca','BRA','São Paulo',290139);
INSERT INTO `city` VALUES (270,'São Vicente','BRA','São Paulo',286848);
INSERT INTO `city` VALUES (271,'Maringá','BRA','Paraná',286461);
INSERT INTO `city` VALUES (272,'Montes Claros','BRA','Minas Gerais',286058);
INSERT INTO `city` VALUES (273,'Anápolis','BRA','Goiás',282197);
INSERT INTO `city` VALUES (274,'Florianópolis','BRA','Santa Catarina',281928);
INSERT INTO `city` VALUES (275,'Petrópolis','BRA','Rio de Janeiro',279183);
INSERT INTO `city` VALUES (276,'Itaquaquecetuba','BRA','São Paulo',270874);
INSERT INTO `city` VALUES (277,'Vitória','BRA','Espírito Santo',270626);
INSERT INTO `city` VALUES (278,'Ponta Grossa','BRA','Paraná',268013);
INSERT INTO `city` VALUES (279,'Rio Branco','BRA','Acre',259537);
INSERT INTO `city` VALUES (280,'Foz do Iguaçu','BRA','Paraná',259425);
INSERT INTO `city` VALUES (281,'Macapá','BRA','Amapá',256033);
INSERT INTO `city` VALUES (282,'Ilhéus','BRA','Bahia',254970);
INSERT INTO `city` VALUES (283,'Vitória da Conquista','BRA','Bahia',253587);
INSERT INTO `city` VALUES (284,'Uberaba','BRA','Minas Gerais',249225);
INSERT INTO `city` VALUES (285,'Paulista','BRA','Pernambuco',248473);
INSERT INTO `city` VALUES (286,'Limeira','BRA','São Paulo',245497);
INSERT INTO `city` VALUES (287,'Blumenau','BRA','Santa Catarina',244379);
INSERT INTO `city` VALUES (288,'Caruaru','BRA','Pernambuco',244247);
INSERT INTO `city` VALUES (289,'Santarém','BRA','Pará',241771);
INSERT INTO `city` VALUES (290,'Volta Redonda','BRA','Rio de Janeiro',240315);
INSERT INTO `city` VALUES (291,'Novo Hamburgo','BRA','Rio Grande do Sul',239940);
INSERT INTO `city` VALUES (292,'Caucaia','BRA','Ceará',238738);
INSERT INTO `city` VALUES (293,'Santa Maria','BRA','Rio Grande do Sul',238473);
INSERT INTO `city` VALUES (294,'Cascavel','BRA','Paraná',237510);
INSERT INTO `city` VALUES (295,'Guarujá','BRA','São Paulo',237206);
INSERT INTO `city` VALUES (296,'Ribeirão das Neves','BRA','Minas Gerais',232685);
INSERT INTO `city` VALUES (297,'Governador Valadares','BRA','Minas Gerais',231724);
INSERT INTO `city` VALUES (298,'Taubaté','BRA','São Paulo',229130);
INSERT INTO `city` VALUES (299,'Imperatriz','BRA','Maranhão',224564);
INSERT INTO `city` VALUES (300,'Gravataí','BRA','Rio Grande do Sul',223011);
INSERT INTO `city` VALUES (301,'Embu','BRA','São Paulo',222223);
INSERT INTO `city` VALUES (302,'Mossoró','BRA','Rio Grande do Norte',214901);
INSERT INTO `city` VALUES (303,'Várzea Grande','BRA','Mato Grosso',214435);
INSERT INTO `city` VALUES (304,'Petrolina','BRA','Pernambuco',210540);
INSERT INTO `city` VALUES (305,'Barueri','BRA','São Paulo',208426);
INSERT INTO `city` VALUES (306,'Viamão','BRA','Rio Grande do Sul',207557);
INSERT INTO `city` VALUES (307,'Ipatinga','BRA','Minas Gerais',206338);
INSERT INTO `city` VALUES (308,'Juazeiro','BRA','Bahia',201073);
INSERT INTO `city` VALUES (309,'Juazeiro do Norte','BRA','Ceará',199636);
INSERT INTO `city` VALUES (310,'Taboão da Serra','BRA','São Paulo',197550);
INSERT INTO `city` VALUES (311,'São José dos Pinhais','BRA','Paraná',196884);
INSERT INTO `city` VALUES (312,'Magé','BRA','Rio de Janeiro',196147);
INSERT INTO `city` VALUES (313,'Suzano','BRA','São Paulo',195434);
INSERT INTO `city` VALUES (314,'São Leopoldo','BRA','Rio Grande do Sul',189258);
INSERT INTO `city` VALUES (315,'Marília','BRA','São Paulo',188691);
INSERT INTO `city` VALUES (316,'São Carlos','BRA','São Paulo',187122);
INSERT INTO `city` VALUES (317,'Sumaré','BRA','São Paulo',186205);
INSERT INTO `city` VALUES (318,'Presidente Prudente','BRA','São Paulo',185340);
INSERT INTO `city` VALUES (319,'Divinópolis','BRA','Minas Gerais',185047);
INSERT INTO `city` VALUES (320,'Sete Lagoas','BRA','Minas Gerais',182984);
INSERT INTO `city` VALUES (321,'Rio Grande','BRA','Rio Grande do Sul',182222);
INSERT INTO `city` VALUES (322,'Itabuna','BRA','Bahia',182148);
INSERT INTO `city` VALUES (323,'Jequié','BRA','Bahia',179128);
INSERT INTO `city` VALUES (324,'Arapiraca','BRA','Alagoas',178988);
INSERT INTO `city` VALUES (325,'Colombo','BRA','Paraná',177764);
INSERT INTO `city` VALUES (326,'Americana','BRA','São Paulo',177409);
INSERT INTO `city` VALUES (327,'Alvorada','BRA','Rio Grande do Sul',175574);
INSERT INTO `city` VALUES (328,'Araraquara','BRA','São Paulo',174381);
INSERT INTO `city` VALUES (329,'Itaboraí','BRA','Rio de Janeiro',173977);
INSERT INTO `city` VALUES (330,'Santa Bárbara d´Oeste','BRA','São Paulo',171657);
INSERT INTO `city` VALUES (331,'Nova Friburgo','BRA','Rio de Janeiro',170697);
INSERT INTO `city` VALUES (332,'Jacareí','BRA','São Paulo',170356);
INSERT INTO `city` VALUES (333,'Araçatuba','BRA','São Paulo',169303);
INSERT INTO `city` VALUES (334,'Barra Mansa','BRA','Rio de Janeiro',168953);
INSERT INTO `city` VALUES (335,'Praia Grande','BRA','São Paulo',168434);
INSERT INTO `city` VALUES (336,'Marabá','BRA','Pará',167795);
INSERT INTO `city` VALUES (337,'Criciúma','BRA','Santa Catarina',167661);
INSERT INTO `city` VALUES (338,'Boa Vista','BRA','Roraima',167185);
INSERT INTO `city` VALUES (339,'Passo Fundo','BRA','Rio Grande do Sul',166343);
INSERT INTO `city` VALUES (340,'Dourados','BRA','Mato Grosso do Sul',164716);
INSERT INTO `city` VALUES (341,'Santa Luzia','BRA','Minas Gerais',164704);
INSERT INTO `city` VALUES (342,'Rio Claro','BRA','São Paulo',163551);
INSERT INTO `city` VALUES (343,'Maracanaú','BRA','Ceará',162022);
INSERT INTO `city` VALUES (344,'Guarapuava','BRA','Paraná',160510);
INSERT INTO `city` VALUES (345,'Rondonópolis','BRA','Mato Grosso',155115);
INSERT INTO `city` VALUES (346,'São José','BRA','Santa Catarina',155105);
INSERT INTO `city` VALUES (347,'Cachoeiro de Itapemirim','BRA','Espírito Santo',155024);
INSERT INTO `city` VALUES (348,'Nilópolis','BRA','Rio de Janeiro',153383);
INSERT INTO `city` VALUES (349,'Itapevi','BRA','São Paulo',150664);
INSERT INTO `city` VALUES (350,'Cabo de Santo Agostinho','BRA','Pernambuco',149964);
INSERT INTO `city` VALUES (351,'Camaçari','BRA','Bahia',149146);
INSERT INTO `city` VALUES (352,'Sobral','BRA','Ceará',146005);
INSERT INTO `city` VALUES (353,'Itajaí','BRA','Santa Catarina',145197);
INSERT INTO `city` VALUES (354,'Chapecó','BRA','Santa Catarina',144158);
INSERT INTO `city` VALUES (355,'Cotia','BRA','São Paulo',140042);
INSERT INTO `city` VALUES (356,'Lages','BRA','Santa Catarina',139570);
INSERT INTO `city` VALUES (357,'Ferraz de Vasconcelos','BRA','São Paulo',139283);
INSERT INTO `city` VALUES (358,'Indaiatuba','BRA','São Paulo',135968);
INSERT INTO `city` VALUES (359,'Hortolândia','BRA','São Paulo',135755);
INSERT INTO `city` VALUES (360,'Caxias','BRA','Maranhão',133980);
INSERT INTO `city` VALUES (361,'São Caetano do Sul','BRA','São Paulo',133321);
INSERT INTO `city` VALUES (362,'Itu','BRA','São Paulo',132736);
INSERT INTO `city` VALUES (363,'Nossa Senhora do Socorro','BRA','Sergipe',131351);
INSERT INTO `city` VALUES (364,'Parnaíba','BRA','Piauí',129756);
INSERT INTO `city` VALUES (365,'Poços de Caldas','BRA','Minas Gerais',129683);
INSERT INTO `city` VALUES (366,'Teresópolis','BRA','Rio de Janeiro',128079);
INSERT INTO `city` VALUES (367,'Barreiras','BRA','Bahia',127801);
INSERT INTO `city` VALUES (368,'Castanhal','BRA','Pará',127634);
INSERT INTO `city` VALUES (369,'Alagoinhas','BRA','Bahia',126820);
INSERT INTO `city` VALUES (370,'Itapecerica da Serra','BRA','São Paulo',126672);
INSERT INTO `city` VALUES (371,'Uruguaiana','BRA','Rio Grande do Sul',126305);
INSERT INTO `city` VALUES (372,'Paranaguá','BRA','Paraná',126076);
INSERT INTO `city` VALUES (373,'Ibirité','BRA','Minas Gerais',125982);
INSERT INTO `city` VALUES (374,'Timon','BRA','Maranhão',125812);
INSERT INTO `city` VALUES (375,'Luziânia','BRA','Goiás',125597);
INSERT INTO `city` VALUES (376,'Macaé','BRA','Rio de Janeiro',125597);
INSERT INTO `city` VALUES (377,'Teófilo Otoni','BRA','Minas Gerais',124489);
INSERT INTO `city` VALUES (378,'Moji-Guaçu','BRA','São Paulo',123782);
INSERT INTO `city` VALUES (379,'Palmas','BRA','Tocantins',121919);
INSERT INTO `city` VALUES (380,'Pindamonhangaba','BRA','São Paulo',121904);
INSERT INTO `city` VALUES (381,'Francisco Morato','BRA','São Paulo',121197);
INSERT INTO `city` VALUES (382,'Bagé','BRA','Rio Grande do Sul',120793);
INSERT INTO `city` VALUES (383,'Sapucaia do Sul','BRA','Rio Grande do Sul',120217);
INSERT INTO `city` VALUES (384,'Cabo Frio','BRA','Rio de Janeiro',119503);
INSERT INTO `city` VALUES (385,'Itapetininga','BRA','São Paulo',119391);
INSERT INTO `city` VALUES (386,'Patos de Minas','BRA','Minas Gerais',119262);
INSERT INTO `city` VALUES (387,'Camaragibe','BRA','Pernambuco',118968);
INSERT INTO `city` VALUES (388,'Bragança Paulista','BRA','São Paulo',116929);
INSERT INTO `city` VALUES (389,'Queimados','BRA','Rio de Janeiro',115020);
INSERT INTO `city` VALUES (390,'Araguaína','BRA','Tocantins',114948);
INSERT INTO `city` VALUES (391,'Garanhuns','BRA','Pernambuco',114603);
INSERT INTO `city` VALUES (392,'Vitória de Santo Antão','BRA','Pernambuco',113595);
INSERT INTO `city` VALUES (393,'Santa Rita','BRA','Paraíba',113135);
INSERT INTO `city` VALUES (394,'Barbacena','BRA','Minas Gerais',113079);
INSERT INTO `city` VALUES (395,'Abaetetuba','BRA','Pará',111258);
INSERT INTO `city` VALUES (396,'Jaú','BRA','São Paulo',109965);
INSERT INTO `city` VALUES (397,'Lauro de Freitas','BRA','Bahia',109236);
INSERT INTO `city` VALUES (398,'Franco da Rocha','BRA','São Paulo',108964);
INSERT INTO `city` VALUES (399,'Teixeira de Freitas','BRA','Bahia',108441);
INSERT INTO `city` VALUES (400,'Varginha','BRA','Minas Gerais',108314);
INSERT INTO `city` VALUES (401,'Ribeirão Pires','BRA','São Paulo',108121);
INSERT INTO `city` VALUES (402,'Sabará','BRA','Minas Gerais',107781);
INSERT INTO `city` VALUES (403,'Catanduva','BRA','São Paulo',107761);
INSERT INTO `city` VALUES (404,'Rio Verde','BRA','Goiás',107755);
INSERT INTO `city` VALUES (405,'Botucatu','BRA','São Paulo',107663);
INSERT INTO `city` VALUES (406,'Colatina','BRA','Espírito Santo',107354);
INSERT INTO `city` VALUES (407,'Santa Cruz do Sul','BRA','Rio Grande do Sul',106734);
INSERT INTO `city` VALUES (408,'Linhares','BRA','Espírito Santo',106278);
INSERT INTO `city` VALUES (409,'Apucarana','BRA','Paraná',105114);
INSERT INTO `city` VALUES (410,'Barretos','BRA','São Paulo',104156);
INSERT INTO `city` VALUES (411,'Guaratinguetá','BRA','São Paulo',103433);
INSERT INTO `city` VALUES (412,'Cachoeirinha','BRA','Rio Grande do Sul',103240);
INSERT INTO `city` VALUES (413,'Codó','BRA','Maranhão',103153);
INSERT INTO `city` VALUES (414,'Jaraguá do Sul','BRA','Santa Catarina',102580);
INSERT INTO `city` VALUES (415,'Cubatão','BRA','São Paulo',102372);
INSERT INTO `city` VALUES (416,'Itabira','BRA','Minas Gerais',102217);
INSERT INTO `city` VALUES (417,'Itaituba','BRA','Pará',101320);
INSERT INTO `city` VALUES (418,'Araras','BRA','São Paulo',101046);
INSERT INTO `city` VALUES (419,'Resende','BRA','Rio de Janeiro',100627);
INSERT INTO `city` VALUES (420,'Atibaia','BRA','São Paulo',100356);
INSERT INTO `city` VALUES (421,'Pouso Alegre','BRA','Minas Gerais',100028);
INSERT INTO `city` VALUES (422,'Toledo','BRA','Paraná',99387);
INSERT INTO `city` VALUES (423,'Crato','BRA','Ceará',98965);
INSERT INTO `city` VALUES (424,'Passos','BRA','Minas Gerais',98570);
INSERT INTO `city` VALUES (425,'Araguari','BRA','Minas Gerais',98399);
INSERT INTO `city` VALUES (426,'São José de Ribamar','BRA','Maranhão',98318);
INSERT INTO `city` VALUES (427,'Pinhais','BRA','Paraná',98198);
INSERT INTO `city` VALUES (428,'Sertãozinho','BRA','São Paulo',98140);
INSERT INTO `city` VALUES (429,'Conselheiro Lafaiete','BRA','Minas Gerais',97507);
INSERT INTO `city` VALUES (430,'Paulo Afonso','BRA','Bahia',97291);
INSERT INTO `city` VALUES (431,'Angra dos Reis','BRA','Rio de Janeiro',96864);
INSERT INTO `city` VALUES (432,'Eunápolis','BRA','Bahia',96610);
INSERT INTO `city` VALUES (433,'Salto','BRA','São Paulo',96348);
INSERT INTO `city` VALUES (434,'Ourinhos','BRA','São Paulo',96291);
INSERT INTO `city` VALUES (435,'Parnamirim','BRA','Rio Grande do Norte',96210);
INSERT INTO `city` VALUES (436,'Jacobina','BRA','Bahia',96131);
INSERT INTO `city` VALUES (437,'Coronel Fabriciano','BRA','Minas Gerais',95933);
INSERT INTO `city` VALUES (438,'Birigui','BRA','São Paulo',94685);
INSERT INTO `city` VALUES (439,'Tatuí','BRA','São Paulo',93897);
INSERT INTO `city` VALUES (440,'Ji-Paraná','BRA','Rondônia',93346);
INSERT INTO `city` VALUES (441,'Bacabal','BRA','Maranhão',93121);
INSERT INTO `city` VALUES (442,'Cametá','BRA','Pará',92779);
INSERT INTO `city` VALUES (443,'Guaíba','BRA','Rio Grande do Sul',92224);
INSERT INTO `city` VALUES (444,'São Lourenço da Mata','BRA','Pernambuco',91999);
INSERT INTO `city` VALUES (445,'Santana do Livramento','BRA','Rio Grande do Sul',91779);
INSERT INTO `city` VALUES (446,'Votorantim','BRA','São Paulo',91777);
INSERT INTO `city` VALUES (447,'Campo Largo','BRA','Paraná',91203);
INSERT INTO `city` VALUES (448,'Patos','BRA','Paraíba',90519);
INSERT INTO `city` VALUES (449,'Ituiutaba','BRA','Minas Gerais',90507);
INSERT INTO `city` VALUES (450,'Corumbá','BRA','Mato Grosso do Sul',90111);
INSERT INTO `city` VALUES (451,'Palhoça','BRA','Santa Catarina',89465);
INSERT INTO `city` VALUES (452,'Barra do Piraí','BRA','Rio de Janeiro',89388);
INSERT INTO `city` VALUES (453,'Bento Gonçalves','BRA','Rio Grande do Sul',89254);
INSERT INTO `city` VALUES (454,'Poá','BRA','São Paulo',89236);
INSERT INTO `city` VALUES (455,'Águas Lindas de Goiás','BRA','Goiás',89200);
INSERT INTO `city` VALUES (456,'London','GBR','England',7285000);
INSERT INTO `city` VALUES (457,'Birmingham','GBR','England',1013000);
INSERT INTO `city` VALUES (458,'Glasgow','GBR','Scotland',619680);
INSERT INTO `city` VALUES (459,'Liverpool','GBR','England',461000);
INSERT INTO `city` VALUES (460,'Edinburgh','GBR','Scotland',450180);
INSERT INTO `city` VALUES (461,'Sheffield','GBR','England',431607);
INSERT INTO `city` VALUES (462,'Manchester','GBR','England',430000);
INSERT INTO `city` VALUES (463,'Leeds','GBR','England',424194);
INSERT INTO `city` VALUES (464,'Bristol','GBR','England',402000);
INSERT INTO `city` VALUES (465,'Cardiff','GBR','Wales',321000);
INSERT INTO `city` VALUES (466,'Coventry','GBR','England',304000);
INSERT INTO `city` VALUES (467,'Leicester','GBR','England',294000);
INSERT INTO `city` VALUES (468,'Bradford','GBR','England',289376);
INSERT INTO `city` VALUES (469,'Belfast','GBR','North Ireland',287500);
INSERT INTO `city` VALUES (470,'Nottingham','GBR','England',287000);
INSERT INTO `city` VALUES (471,'Kingston upon Hull','GBR','England',262000);
INSERT INTO `city` VALUES (472,'Plymouth','GBR','England',253000);
INSERT INTO `city` VALUES (473,'Stoke-on-Trent','GBR','England',252000);
INSERT INTO `city` VALUES (474,'Wolverhampton','GBR','England',242000);
INSERT INTO `city` VALUES (475,'Derby','GBR','England',236000);
INSERT INTO `city` VALUES (476,'Swansea','GBR','Wales',230000);
INSERT INTO `city` VALUES (477,'Southampton','GBR','England',216000);
INSERT INTO `city` VALUES (478,'Aberdeen','GBR','Scotland',213070);
INSERT INTO `city` VALUES (479,'Northampton','GBR','England',196000);
INSERT INTO `city` VALUES (480,'Dudley','GBR','England',192171);
INSERT INTO `city` VALUES (481,'Portsmouth','GBR','England',190000);
INSERT INTO `city` VALUES (482,'Newcastle upon Tyne','GBR','England',189150);
INSERT INTO `city` VALUES (483,'Sunderland','GBR','England',183310);
INSERT INTO `city` VALUES (484,'Luton','GBR','England',183000);
INSERT INTO `city` VALUES (485,'Swindon','GBR','England',180000);
INSERT INTO `city` VALUES (486,'Southend-on-Sea','GBR','England',176000);
INSERT INTO `city` VALUES (487,'Walsall','GBR','England',174739);
INSERT INTO `city` VALUES (488,'Bournemouth','GBR','England',162000);
INSERT INTO `city` VALUES (489,'Peterborough','GBR','England',156000);
INSERT INTO `city` VALUES (490,'Brighton','GBR','England',156124);
INSERT INTO `city` VALUES (491,'Blackpool','GBR','England',151000);
INSERT INTO `city` VALUES (492,'Dundee','GBR','Scotland',146690);
INSERT INTO `city` VALUES (493,'West Bromwich','GBR','England',146386);
INSERT INTO `city` VALUES (494,'Reading','GBR','England',148000);
INSERT INTO `city` VALUES (495,'Oldbury/Smethwick (Warley)','GBR','England',145542);
INSERT INTO `city` VALUES (496,'Middlesbrough','GBR','England',145000);
INSERT INTO `city` VALUES (497,'Huddersfield','GBR','England',143726);
INSERT INTO `city` VALUES (498,'Oxford','GBR','England',144000);
INSERT INTO `city` VALUES (499,'Poole','GBR','England',141000);
INSERT INTO `city` VALUES (500,'Bolton','GBR','England',139020);
INSERT INTO `city` VALUES (501,'Blackburn','GBR','England',140000);
INSERT INTO `city` VALUES (502,'Newport','GBR','Wales',139000);
INSERT INTO `city` VALUES (503,'Preston','GBR','England',135000);
INSERT INTO `city` VALUES (504,'Stockport','GBR','England',132813);
INSERT INTO `city` VALUES (505,'Norwich','GBR','England',124000);
INSERT INTO `city` VALUES (506,'Rotherham','GBR','England',121380);
INSERT INTO `city` VALUES (507,'Cambridge','GBR','England',121000);
INSERT INTO `city` VALUES (508,'Watford','GBR','England',113080);
INSERT INTO `city` VALUES (509,'Ipswich','GBR','England',114000);
INSERT INTO `city` VALUES (510,'Slough','GBR','England',112000);
INSERT INTO `city` VALUES (511,'Exeter','GBR','England',111000);
INSERT INTO `city` VALUES (512,'Cheltenham','GBR','England',106000);
INSERT INTO `city` VALUES (513,'Gloucester','GBR','England',107000);
INSERT INTO `city` VALUES (514,'Saint Helens','GBR','England',106293);
INSERT INTO `city` VALUES (515,'Sutton Coldfield','GBR','England',106001);
INSERT INTO `city` VALUES (516,'York','GBR','England',104425);
INSERT INTO `city` VALUES (517,'Oldham','GBR','England',103931);
INSERT INTO `city` VALUES (518,'Basildon','GBR','England',100924);
INSERT INTO `city` VALUES (519,'Worthing','GBR','England',100000);
INSERT INTO `city` VALUES (520,'Chelmsford','GBR','England',97451);
INSERT INTO `city` VALUES (521,'Colchester','GBR','England',96063);
INSERT INTO `city` VALUES (522,'Crawley','GBR','England',97000);
INSERT INTO `city` VALUES (523,'Gillingham','GBR','England',92000);
INSERT INTO `city` VALUES (524,'Solihull','GBR','England',94531);
INSERT INTO `city` VALUES (525,'Rochdale','GBR','England',94313);
INSERT INTO `city` VALUES (526,'Birkenhead','GBR','England',93087);
INSERT INTO `city` VALUES (527,'Worcester','GBR','England',95000);
INSERT INTO `city` VALUES (528,'Hartlepool','GBR','England',92000);
INSERT INTO `city` VALUES (529,'Halifax','GBR','England',91069);
INSERT INTO `city` VALUES (530,'Woking/Byfleet','GBR','England',92000);
INSERT INTO `city` VALUES (531,'Southport','GBR','England',90959);
INSERT INTO `city` VALUES (532,'Maidstone','GBR','England',90878);
INSERT INTO `city` VALUES (533,'Eastbourne','GBR','England',90000);
INSERT INTO `city` VALUES (534,'Grimsby','GBR','England',89000);
INSERT INTO `city` VALUES (535,'Saint Helier','GBR','Jersey',27523);
INSERT INTO `city` VALUES (536,'Douglas','GBR','–',23487);
INSERT INTO `city` VALUES (537,'Road Town','VGB','Tortola',8000);
INSERT INTO `city` VALUES (538,'Bandar Seri Begawan','BRN','Brunei and Muara',21484);
INSERT INTO `city` VALUES (539,'Sofija','BGR','Grad Sofija',1122302);
INSERT INTO `city` VALUES (540,'Plovdiv','BGR','Plovdiv',342584);
INSERT INTO `city` VALUES (541,'Varna','BGR','Varna',299801);
INSERT INTO `city` VALUES (542,'Burgas','BGR','Burgas',195255);
INSERT INTO `city` VALUES (543,'Ruse','BGR','Ruse',166467);
INSERT INTO `city` VALUES (544,'Stara Zagora','BGR','Haskovo',147939);
INSERT INTO `city` VALUES (545,'Pleven','BGR','Lovec',121952);
INSERT INTO `city` VALUES (546,'Sliven','BGR','Burgas',105530);
INSERT INTO `city` VALUES (547,'Dobric','BGR','Varna',100399);
INSERT INTO `city` VALUES (548,'Šumen','BGR','Varna',94686);
INSERT INTO `city` VALUES (549,'Ouagadougou','BFA','Kadiogo',824000);
INSERT INTO `city` VALUES (550,'Bobo-Dioulasso','BFA','Houet',300000);
INSERT INTO `city` VALUES (551,'Koudougou','BFA','Boulkiemdé',105000);
INSERT INTO `city` VALUES (552,'Bujumbura','BDI','Bujumbura',300000);
INSERT INTO `city` VALUES (553,'George Town','CYM','Grand Cayman',19600);
INSERT INTO `city` VALUES (554,'Santiago de Chile','CHL','Santiago',4703954);
INSERT INTO `city` VALUES (555,'Puente Alto','CHL','Santiago',386236);
INSERT INTO `city` VALUES (556,'Viña del Mar','CHL','Valparaíso',312493);
INSERT INTO `city` VALUES (557,'Valparaíso','CHL','Valparaíso',293800);
INSERT INTO `city` VALUES (558,'Talcahuano','CHL','Bíobío',277752);
INSERT INTO `city` VALUES (559,'Antofagasta','CHL','Antofagasta',251429);
INSERT INTO `city` VALUES (560,'San Bernardo','CHL','Santiago',241910);
INSERT INTO `city` VALUES (561,'Temuco','CHL','La Araucanía',233041);
INSERT INTO `city` VALUES (562,'Concepción','CHL','Bíobío',217664);
INSERT INTO `city` VALUES (563,'Rancagua','CHL','O´Higgins',212977);
INSERT INTO `city` VALUES (564,'Arica','CHL','Tarapacá',189036);
INSERT INTO `city` VALUES (565,'Talca','CHL','Maule',187557);
INSERT INTO `city` VALUES (566,'Chillán','CHL','Bíobío',178182);
INSERT INTO `city` VALUES (567,'Iquique','CHL','Tarapacá',177892);
INSERT INTO `city` VALUES (568,'Los Angeles','CHL','Bíobío',158215);
INSERT INTO `city` VALUES (569,'Puerto Montt','CHL','Los Lagos',152194);
INSERT INTO `city` VALUES (570,'Coquimbo','CHL','Coquimbo',143353);
INSERT INTO `city` VALUES (571,'Osorno','CHL','Los Lagos',141468);
INSERT INTO `city` VALUES (572,'La Serena','CHL','Coquimbo',137409);
INSERT INTO `city` VALUES (573,'Calama','CHL','Antofagasta',137265);
INSERT INTO `city` VALUES (574,'Valdivia','CHL','Los Lagos',133106);
INSERT INTO `city` VALUES (575,'Punta Arenas','CHL','Magallanes',125631);
INSERT INTO `city` VALUES (576,'Copiapó','CHL','Atacama',120128);
INSERT INTO `city` VALUES (577,'Quilpué','CHL','Valparaíso',118857);
INSERT INTO `city` VALUES (578,'Curicó','CHL','Maule',115766);
INSERT INTO `city` VALUES (579,'Ovalle','CHL','Coquimbo',94854);
INSERT INTO `city` VALUES (580,'Coronel','CHL','Bíobío',93061);
INSERT INTO `city` VALUES (581,'San Pedro de la Paz','CHL','Bíobío',91684);
INSERT INTO `city` VALUES (582,'Melipilla','CHL','Santiago',91056);
INSERT INTO `city` VALUES (583,'Avarua','COK','Rarotonga',11900);
INSERT INTO `city` VALUES (584,'San José','CRI','San José',339131);
INSERT INTO `city` VALUES (585,'Djibouti','DJI','Djibouti',383000);
INSERT INTO `city` VALUES (586,'Roseau','DMA','St George',16243);
INSERT INTO `city` VALUES (587,'Santo Domingo de Guzmán','DOM','Distrito Nacional',1609966);
INSERT INTO `city` VALUES (588,'Santiago de los Caballeros','DOM','Santiago',365463);
INSERT INTO `city` VALUES (589,'La Romana','DOM','La Romana',140204);
INSERT INTO `city` VALUES (590,'San Pedro de Macorís','DOM','San Pedro de Macorís',124735);
INSERT INTO `city` VALUES (591,'San Francisco de Macorís','DOM','Duarte',108485);
INSERT INTO `city` VALUES (592,'San Felipe de Puerto Plata','DOM','Puerto Plata',89423);
INSERT INTO `city` VALUES (593,'Guayaquil','ECU','Guayas',2070040);
INSERT INTO `city` VALUES (594,'Quito','ECU','Pichincha',1573458);
INSERT INTO `city` VALUES (595,'Cuenca','ECU','Azuay',270353);
INSERT INTO `city` VALUES (596,'Machala','ECU','El Oro',210368);
INSERT INTO `city` VALUES (597,'Santo Domingo de los Colorados','ECU','Pichincha',202111);
INSERT INTO `city` VALUES (598,'Portoviejo','ECU','Manabí',176413);
INSERT INTO `city` VALUES (599,'Ambato','ECU','Tungurahua',169612);
INSERT INTO `city` VALUES (600,'Manta','ECU','Manabí',164739);
INSERT INTO `city` VALUES (601,'Duran [Eloy Alfaro]','ECU','Guayas',152514);
INSERT INTO `city` VALUES (602,'Ibarra','ECU','Imbabura',130643);
INSERT INTO `city` VALUES (603,'Quevedo','ECU','Los Ríos',129631);
INSERT INTO `city` VALUES (604,'Milagro','ECU','Guayas',124177);
INSERT INTO `city` VALUES (605,'Loja','ECU','Loja',123875);
INSERT INTO `city` VALUES (606,'Ríobamba','ECU','Chimborazo',123163);
INSERT INTO `city` VALUES (607,'Esmeraldas','ECU','Esmeraldas',123045);
INSERT INTO `city` VALUES (608,'Cairo','EGY','Kairo',6789479);
INSERT INTO `city` VALUES (609,'Alexandria','EGY','Aleksandria',3328196);
INSERT INTO `city` VALUES (610,'Giza','EGY','Giza',2221868);
INSERT INTO `city` VALUES (611,'Shubra al-Khayma','EGY','al-Qalyubiya',870716);
INSERT INTO `city` VALUES (612,'Port Said','EGY','Port Said',469533);
INSERT INTO `city` VALUES (613,'Suez','EGY','Suez',417610);
INSERT INTO `city` VALUES (614,'al-Mahallat al-Kubra','EGY','al-Gharbiya',395402);
INSERT INTO `city` VALUES (615,'Tanta','EGY','al-Gharbiya',371010);
INSERT INTO `city` VALUES (616,'al-Mansura','EGY','al-Daqahliya',369621);
INSERT INTO `city` VALUES (617,'Luxor','EGY','Luxor',360503);
INSERT INTO `city` VALUES (618,'Asyut','EGY','Asyut',343498);
INSERT INTO `city` VALUES (619,'Bahtim','EGY','al-Qalyubiya',275807);
INSERT INTO `city` VALUES (620,'Zagazig','EGY','al-Sharqiya',267351);
INSERT INTO `city` VALUES (621,'al-Faiyum','EGY','al-Faiyum',260964);
INSERT INTO `city` VALUES (622,'Ismailia','EGY','Ismailia',254477);
INSERT INTO `city` VALUES (623,'Kafr al-Dawwar','EGY','al-Buhayra',231978);
INSERT INTO `city` VALUES (624,'Assuan','EGY','Assuan',219017);
INSERT INTO `city` VALUES (625,'Damanhur','EGY','al-Buhayra',212203);
INSERT INTO `city` VALUES (626,'al-Minya','EGY','al-Minya',201360);
INSERT INTO `city` VALUES (627,'Bani Suwayf','EGY','Bani Suwayf',172032);
INSERT INTO `city` VALUES (628,'Qina','EGY','Qina',171275);
INSERT INTO `city` VALUES (629,'Sawhaj','EGY','Sawhaj',170125);
INSERT INTO `city` VALUES (630,'Shibin al-Kawm','EGY','al-Minufiya',159909);
INSERT INTO `city` VALUES (631,'Bulaq al-Dakrur','EGY','Giza',148787);
INSERT INTO `city` VALUES (632,'Banha','EGY','al-Qalyubiya',145792);
INSERT INTO `city` VALUES (633,'Warraq al-Arab','EGY','Giza',127108);
INSERT INTO `city` VALUES (634,'Kafr al-Shaykh','EGY','Kafr al-Shaykh',124819);
INSERT INTO `city` VALUES (635,'Mallawi','EGY','al-Minya',119283);
INSERT INTO `city` VALUES (636,'Bilbays','EGY','al-Sharqiya',113608);
INSERT INTO `city` VALUES (637,'Mit Ghamr','EGY','al-Daqahliya',101801);
INSERT INTO `city` VALUES (638,'al-Arish','EGY','Shamal Sina',100447);
INSERT INTO `city` VALUES (639,'Talkha','EGY','al-Daqahliya',97700);
INSERT INTO `city` VALUES (640,'Qalyub','EGY','al-Qalyubiya',97200);
INSERT INTO `city` VALUES (641,'Jirja','EGY','Sawhaj',95400);
INSERT INTO `city` VALUES (642,'Idfu','EGY','Qina',94200);
INSERT INTO `city` VALUES (643,'al-Hawamidiya','EGY','Giza',91700);
INSERT INTO `city` VALUES (644,'Disuq','EGY','Kafr al-Shaykh',91300);
INSERT INTO `city` VALUES (645,'San Salvador','SLV','San Salvador',415346);
INSERT INTO `city` VALUES (646,'Santa Ana','SLV','Santa Ana',139389);
INSERT INTO `city` VALUES (647,'Mejicanos','SLV','San Salvador',138800);
INSERT INTO `city` VALUES (648,'Soyapango','SLV','San Salvador',129800);
INSERT INTO `city` VALUES (649,'San Miguel','SLV','San Miguel',127696);
INSERT INTO `city` VALUES (650,'Nueva San Salvador','SLV','La Libertad',98400);
INSERT INTO `city` VALUES (651,'Apopa','SLV','San Salvador',88800);
INSERT INTO `city` VALUES (652,'Asmara','ERI','Maekel',431000);
INSERT INTO `city` VALUES (653,'Madrid','ESP','Madrid',2879052);
INSERT INTO `city` VALUES (654,'Barcelona','ESP','Katalonia',1503451);
INSERT INTO `city` VALUES (655,'Valencia','ESP','Valencia',739412);
INSERT INTO `city` VALUES (656,'Sevilla','ESP','Andalusia',701927);
INSERT INTO `city` VALUES (657,'Zaragoza','ESP','Aragonia',603367);
INSERT INTO `city` VALUES (658,'Málaga','ESP','Andalusia',530553);
INSERT INTO `city` VALUES (659,'Bilbao','ESP','Baskimaa',357589);
INSERT INTO `city` VALUES (660,'Las Palmas de Gran Canaria','ESP','Canary Islands',354757);
INSERT INTO `city` VALUES (661,'Murcia','ESP','Murcia',353504);
INSERT INTO `city` VALUES (662,'Palma de Mallorca','ESP','Balears',326993);
INSERT INTO `city` VALUES (663,'Valladolid','ESP','Castilla and León',319998);
INSERT INTO `city` VALUES (664,'Córdoba','ESP','Andalusia',311708);
INSERT INTO `city` VALUES (665,'Vigo','ESP','Galicia',283670);
INSERT INTO `city` VALUES (666,'Alicante [Alacant]','ESP','Valencia',272432);
INSERT INTO `city` VALUES (667,'Gijón','ESP','Asturia',267980);
INSERT INTO `city` VALUES (668,'L´Hospitalet de Llobregat','ESP','Katalonia',247986);
INSERT INTO `city` VALUES (669,'Granada','ESP','Andalusia',244767);
INSERT INTO `city` VALUES (670,'A Coruña (La Coruña)','ESP','Galicia',243402);
INSERT INTO `city` VALUES (671,'Vitoria-Gasteiz','ESP','Baskimaa',217154);
INSERT INTO `city` VALUES (672,'Santa Cruz de Tenerife','ESP','Canary Islands',213050);
INSERT INTO `city` VALUES (673,'Badalona','ESP','Katalonia',209635);
INSERT INTO `city` VALUES (674,'Oviedo','ESP','Asturia',200453);
INSERT INTO `city` VALUES (675,'Móstoles','ESP','Madrid',195351);
INSERT INTO `city` VALUES (676,'Elche [Elx]','ESP','Valencia',193174);
INSERT INTO `city` VALUES (677,'Sabadell','ESP','Katalonia',184859);
INSERT INTO `city` VALUES (678,'Santander','ESP','Cantabria',184165);
INSERT INTO `city` VALUES (679,'Jerez de la Frontera','ESP','Andalusia',182660);
INSERT INTO `city` VALUES (680,'Pamplona [Iruña]','ESP','Navarra',180483);
INSERT INTO `city` VALUES (681,'Donostia-San Sebastián','ESP','Baskimaa',179208);