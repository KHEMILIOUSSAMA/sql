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