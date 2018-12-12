#!/bin/bash

cd /var/monkey
/var/monkey/monkey_island/bin/mongodb/bin/mongod --quiet --dbpath /var/monkey/monkey_island/db &
python monkey_island.py