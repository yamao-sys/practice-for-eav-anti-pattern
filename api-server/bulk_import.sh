#!/bin/bash

for i in `seq 1 10`
do
  echo "start bulk import $i"
  bundle exec rake bulk_import:run
done