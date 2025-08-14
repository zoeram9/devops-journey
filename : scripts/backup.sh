#!/bin/bash
# Simple Backup Script
echo "Starting backup process..."
mkdir -p ~/backup
cp *.sh ~/backup
echo "Backup completed at $(date)" >> ~/backup/log.txt
