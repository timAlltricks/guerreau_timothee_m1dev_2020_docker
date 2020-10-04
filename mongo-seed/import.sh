#! /bin/bash

mongoimport --host mongo --db docker --collection users --type json --file /mongo-seed/users.json --jsonArray