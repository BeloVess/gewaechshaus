#!/bin/bash

cd /home/helga/backup/
rm -rf files/*
mv /home/helga/Downloads/БелоВесь* .
unzip БелоВесь* -d files
rm -rf БелоВесь*
rsync -av --delete files/ root@belowess.ru:/root/backup
