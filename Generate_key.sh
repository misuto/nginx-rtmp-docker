#!/bin/bash
DATE=$1
TIME=$2
KEY=$3
APP=$4
STREAM=$5

if [[ "$#" < 3 ]]; then
  echo "Arguments: <Date(YYYY-MM-DD)> <Time(hh:mm)> <Key> <Application> <Stream>"

else
  DATETIME=$(date -d "$DATE $TIME" +%s)
  COMBOKEY=$()

  FULLKEY=``

  echo -n "Full streamkey: $STREAM?e=$DATETIME&st="
  echo -n "$KEY$APP/$STREAM$DATETIME"|openssl dgst -md5 -binary|openssl enc -base64|tr '+/' '-_'|tr -d '='

fi
