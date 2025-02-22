#!/usr/bin/env bash
cd ../api
set -o allexport
source ../.env
set +o allexport
rm -rf $PROMETHEUS_MULTIPROC_DIR
mkdir -p $PROMETHEUS_MULTIPROC_DIR
$PWD/../venv/bin/gunicorn --workers=$WORKERS --threads=2 --worker-class=gthread --config=gunicorn.conf.py --timeout=3600 --bind=0.0.0.0:5000 "app:create_app()"