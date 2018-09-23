import flask
import os

app = flask.Flask("app")

@app.route("/")
def simple():
    return 'Hello world!'
