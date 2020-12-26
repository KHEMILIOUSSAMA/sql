SELECT Espece.id,                   
       Espece.description,          
       Animal.nom                    
INNER JOIN Animal ON Espece.id = Animal.espece_id
WHERE Animal.nom LIKE 'Ch%';