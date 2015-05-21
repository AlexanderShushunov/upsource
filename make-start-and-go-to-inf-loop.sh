#!/bin/bash
UPSOURCE_HOME=$1
OUTPUT_FILE=$UPSOURCE_HOME/bin/start-and-go-to-inf-loop.sh
echo "#!/bin/sh" >> $OUTPUT_FILE
echo $UPSOURCE_HOME"/bin/upsource.sh start" >> $OUTPUT_FILE
echo " while :; do sleep 1000; done" >> $OUTPUT_FILE
chmod +x $OUTPUT_FILE