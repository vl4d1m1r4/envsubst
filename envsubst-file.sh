#!/usr/bin/env sh
set -e

PROCESSED=false
WORKDIR=/workdir

for i in $(ls $WORKDIR); do
  echo "Processing $i ..."

  envsubst "$(compgen -e | awk '$0="${"$0"}"')" < $WORKDIR/$i > /processed/$i
  PROCESSED=true
done

ls /processed/

if [ ! $PROCESSED = true ]
then
  echo 'No files processed'
  exit 1
fi