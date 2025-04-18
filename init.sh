#!/bin/bash
apt-get update && apt-get install -y python3 python3-pip
exec "$@"

pip install pandas
exec "$@"