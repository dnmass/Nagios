HOST=dockers02
PORT=49230

/usr/bin/check_postgres --action=connection --host=$HOST --port=$PORT  --dbuser=admin --dbpass=admin --output=simple  | while read rc
do
if [ $rc -eq 1 ]
then echo "postgres check on $HOST:$PORT shows OK"
elif [ $rc -eq 2 ]
then echo "postgres check on $HOST:$PORT shows WARNING"
elif [ $rc -eq 3 ]
then echo "postgres check on $HOST:$PORT shows CRITICAL"
elif [ $rc -eq 4 ]
then echo "postgres check on $HOST:$PORT shows UNKNOWN"
fi
done
