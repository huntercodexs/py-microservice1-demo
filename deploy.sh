#!/bin/bash

HOME_APPS=/home/${USER}/pyapps
LIB_DIR=/lib/systemd/system
SYSTEMD_DIR=/etc/systemd/system
SERVICE_DIR=${SYSTEMD_DIR}/multi-user.target.wants

pip install --upgrade pip
pip install virtualenv

echo "DEPLOY MICROSERVICE 1 STARTED"
APP_NAME="py_microservice1_demo"
APP_ENV="py_microservice1_demo_env"
cd "${HOME_APPS}/${APP_NAME}/"
python3 -m venv ${APP_ENV}
source "${APP_ENV}/bin/activate"
#pip install -r requirements.txt #Maybe it can be crashed, so comment it line
pip install wheel
pip install gunicorn
pip install flask
pip install -U flask-cors
echo "Creating service"
sleep 2
sudo cp "${APP_NAME}.service" "${SYSTEMD_DIR}/${APP_NAME}.service"
sudo cp "${APP_NAME}.service" "${LIB_DIR}/${APP_NAME}.service"
sudo ln -s "${LIB_DIR}/${APP_NAME}.service" "${SERVICE_DIR}/${APP_NAME}.service"
echo "Starting service"
sleep 2
sudo service ${APP_NAME} start
sudo service ${APP_NAME} status
sudo systemctl daemon-reload
sleep 2
deactivate
echo "...OK"

