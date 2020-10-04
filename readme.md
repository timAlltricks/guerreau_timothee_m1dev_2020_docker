Connectez-vous avec ces entrées :
- yosman@hotmail.com
- timtim

Projet lancer une API RSET NodeJS avec docker (docker-compose et dockerfile)

Les ports utilisés dans les Dockerfile doivent correspondre avec ceux déclarés dans le fichier /backend/app.js (connection avec moongose port DB + port Ecoute).

Le docker compose sera alimenté par 3 services:
- Server
- Mongo
- Client

- Le server : /backend/Dockerfile
Son image se base sur Node 12. On copie le package.json pour ensuite lancer l'installation des dépendance (RUN npm install).
On expose le service sur le port 8080 et on le lance (npm start).
Le service utilisant à cette image est lié au service Mongo.

- Le client: /frontend/Dockerfile
Son image se base sur Alpine avec Node 12. On copie le package.json pour ensuite lancer l'installation des dépendance (RUN npm install).
On expose le service sur le port 3000 et on le lance (npm start).

- Mongo:
Son image se base sur la dernière version de mongo. On copie les données à importer, puis on execute la commande afin d'importer les collections JSON(users, posts) dans la BDD.
Le service Mongo va utiliser le volume mongo-data (déclaré après les services) afin de bénéficier de la persistance de données.

Un dernier service va être lancé et terminé pendant la composition du Docker : Mongo-seed
Celui-ci permet d'effectuer des actions sur la BDD avant de lancer l'intégralité des services. Bien sûr ce service est lié à Mongo.
C'est ce service qui a comme build le Dockerfile du dossier mongo-seed, c'est donc lui qui va executer les commandes d'import JSON.
Le dossier mongo-seed contient les fichiers/collections JSON.