from flask import Flask, request
from flask_cors.decorator import cross_origin
from source import *


app = Flask(__name__)


@app.route("/py-microservice1-demo/api/welcome", methods=["GET"])
@cross_origin()
def welcome():
    return response_generator(200, "Everything fine !", "response", "Welcome to MICROSERVICE 1", "request")


@app.route("/py-microservice1-demo/api/article", methods=["POST"])
@cross_origin()
def article():
    params = request.get_json()
    return response_generator(200, "Everything fine !", "response", "Create new article MICROSERVICE 1", "request", params)


@app.route("/py-microservice1-demo")
@cross_origin()
def access_denied():
    return response_generator(403, "Access Denied !", "", "", "", "")

