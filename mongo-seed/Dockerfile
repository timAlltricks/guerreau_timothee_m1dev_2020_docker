FROM mongo:latest

COPY users.json /users.json
COPY posts.json /posts.json
CMD mongoimport --host mongo --db docker --collection posts --type json --file /posts.json --jsonArray ; mongoimport --host mongo --db docker --collection users --type json --file /users.json --jsonArray