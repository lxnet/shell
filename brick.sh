#!/bin/sh
#
#

# Base pad van de backup 
BASE_PATH="/var/log/remote"

# Directory datum
DIR_DATE=`date +%W-%Y`

for DIR in $REMOTE_SERVERS ; do

        # If the dir isnt here create it
        if [ ! -e $BASE_PATH/$DIR/saved/$DIR_DATE ] ; then

                mkdir $BASE_PATH/$DIR/saved/$DIR_DATE

        fi

        for FILE in $REMOTE_LOGS ; do

                if [ "$DIR/$FILE" ] ; then

                        mv $BASE_PATH/$DIR/$FILE*.gz $BASE_PATH/$DIR/saved/$DIR_DATE/

                fi      

        done
                
                # Remove everything older as 26 weeks
                find $BASE_PATH/$DIR/saved -name "*.*" -type d -mtime 185 -exec rm -rf {} \;

done
