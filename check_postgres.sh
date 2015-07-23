#!/bin/bash

HOST=$1
PORT=$2
user=$3
pw=$4

/usr/bin/check_postgres --action=connection --host=$HOST --port=$PORT  --dbuser=$user --dbpass=$pw --output=simple  
