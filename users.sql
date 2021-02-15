CREATE TABLE USERS 
(
 id INT IDENTITY(1,1) PRIMARY KEY,

  nom VARCHAR(100),
    prenom VARCHAR(100),
	portable varchar(100),
	fonction varchar(100) 
	)
	INSERT INTO users (nom, prenom, portable, fonction)
 VALUES
 ('oussama', 'khemili', '06132', 'responsable'),
 ('hamza', 'grichi', '07215', 'commercial'),
 ('jawher', 'chaded', '062125', 'commercial');
 select * from users

 alter table users
 add id_responsable varchar(100);
 UPDATE users
SET id_responsable= '1' where users.id in (2,3);










select u.nom , ur.nom as responsable
from users u 
inner join users as ur on u.id_responsable = ur.id




CREATE TABLE categorie
(
 id_categrie INT IDENTITY(1,1) PRIMARY KEY,

  nom VARCHAR(100),
    
	descriptions varchar(100),
	id_parents varchar(100) 
	)
	select * from categorie


INSERT INTO categorie (nom, descriptions, id_parents)
 VALUES
 ('promo', 'promotions',''),
 ('femmes', 'pour elle', '1'),
 ('hommes', 'pour il', '1'),
 ('bijoux', 'femme bijoux','2'),
 ('sport', 'sport homme','3');
  select c.nom as nom_categorie,cat.nom as nom_parents
  from categorie c
  left join categorie as cat on c.id_parents=cat.id_categrie
 


