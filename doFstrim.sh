#!/bin/bash

LOGFILE=/var/log/ssd_trim.log
SSD_MOUNT='/ /media/sda2/' # Chane for you folder where you mount the SSD partitions

[ ! -e $LOGFILE ] && touch $LOGFILE

echo "*** $(date -R) ***" | tee -a $LOGFILE

for MNT in $SSD_MOUNT; do
    fstrim -v "$MNT" | tee -a $LOGFILE
done

echo "    -------------------------------" | tee -a $LOGFILE
