#!/bin/bash

HOME_APPS=/home/${USER}/pyapps
LIB_DIR=/lib/systemd/system
SYSTEMD_DIR=/etc/systemd/system
SERVICE_DIR=${SYSTEMD_DIR}/multi-user.target.wants

echo "REMOVE MICROSERVICE 1 STARTED"
APP_NAME="py_microservice1_demo"
APP_ENV="py_microservice1_demo_env"
echo "Stopping service and remove .service files"
sleep 2
service ${APP_NAME} stop
sudo rm -rf "${SYSTEMD_DIR}/${APP_NAME}.service"
sudo rm -rf "${LIB_DIR}/${APP_NAME}.service"
sudo unlink "${SERVICE_DIR}/${APP_NAME}.service"
echo "Removing files"
sleep 2
sudo rm -rf "${HOME_APPS}/${APP_NAME}/${APP_ENV}"
sudo rm -rf "${HOME_APPS}/${APP_NAME}/${APP_NAME}.sock"
sudo rm -rf "${HOME_APPS}/${APP_NAME}/__pycache__"
sleep 2
systemctl daemon-reload
sleep 2
echo "Checking service status: Expected [Unit ${APP_NAME}.service could not be found.]"
sleep 2
service ${APP_NAME} status
sleep 2
echo "...OK"
