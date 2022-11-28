#!/bin/bash

LOG_FILE=`date -I`.log

date -Iseconds | tee -a $LOG_FILE
who | tee -a $LOG_FILE
uptime | tee -a $LOG_FILE
echo "" >> $LOG_FILE
