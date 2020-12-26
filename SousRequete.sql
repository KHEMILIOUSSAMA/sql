SELECT id, sexe, nom, espece_id, race_id 
FROM Animal
WHERE (id, race_id) = ( SELECT id, espece_id FROM Race WHERE id = 7)
