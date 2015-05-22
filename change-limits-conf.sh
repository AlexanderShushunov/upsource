#!/bin/bash

DIST_FILE=/etc/security/limits.conf
TMP_FILE=/tmp/limits.conf.tmp

grep -v "# End of file" < $DIST_FILE > $TMP_FILE

echo "memlock unlimited" >> $TMP_FILE
echo "nofile 100000" >> $TMP_FILE
echo "nproc 32768" >> $TMP_FILE
echo "as unlimited" >> $TMP_FILE
echo "# End of file" >> $TMP_FILE

mv -f $TMP_FILE $DIST_FILE
