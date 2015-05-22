#!/bin/bash
UPSOURCE_HOME=$1
OUTPUT_FILE=$UPSOURCE_HOME/bin/start-and-go-to-inf-loop.sh
UPSOURCE_SH=$UPSOURCE_HOME/bin/upsource.sh

echo "#!/bin/sh" >> $OUTPUT_FILE

echo $UPSOURCE_SH start >> $OUTPUT_FILE

#touch to start
echo "sleep 10" >> $OUTPUT_FILE
echo "curl http://localhost:8080" >> $OUTPUT_FILE

echo " while :; do sleep 1000; done" >> $OUTPUT_FILE

chmod +x $OUTPUT_FILE