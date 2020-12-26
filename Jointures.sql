SELECT Espece.id,                   
       Espece.description,          
       Animal.nom                    
INNER JOIN Animal ON Espece.id = Animal.espece_id
WHERE Animal.nom LIKE 'Ch%';


SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Animal                                                
RIGHT JOIN Race                                            
    ON Animal.race_id = Race.id
WHERE Race.espece_id = 2
ORDER BY Race.nom, Animal.nom;


select A.nom AS NOM_ANIMAL , R.NOM AS NOM_RACE, P.NOM AS PAPA , M.NOM AS MAMAN 
FROM ANIMAL A 
INNER JOIN RACE R ON A.race_id= R.id
INNER JOIN ANIMAL P ON A.PERE_id=P.id
inner join ANIMAL M on A.MERE_ID=M.id