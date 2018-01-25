#!/bin/bash
# CREATED BY RMITULA 25.01.2018 2:53
###########################################################
#                  CONFIGURATION                          #
###########################################################

#FOLDER TO STORE YOUR ALL BACKUPS
DESTINATION_FOLDER=backups

#FOLDERS TO BACKUP
FOLDERS=(server1 server2)

#DAYS UNTIL BACKUP WILL BE DELETED
DAYS=5

###########################################################

BACKUPTIME=`date +%b-%d-%y`
$DAYS-=1
mkdir $DESTINATION_FOLDER

for folder in "${FOLDERS[@]}"
do
echo "Started makeing backup of $folder."
mkdir backups/$folder
FILE_NAME=$folder-$BACKUPTIME.tar.gz
tar -zcvf $DESTINATION_FOLDER/$folder/$FILE_NAME $folder
echo "Finished backup of $FILE_NAME."
echo "Deleting files older than $DAYS days in $folder (if exists) ..."
find "$DESTINATION_FOLDER/$folder" -mtime +$DAYS -delete
echo "done."
done
