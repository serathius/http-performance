import flask
import os

app = flask.Flask("app")

@app.route("/")
def simple():
    return 'Hello world!'

if os.environ.get("SERVER") == 'bjoern':
    import bjoern
    bjoern.run(app, '127.0.0.1', 8000)

if os.environ.get("SERVER") == 'netius':
    import netius.servers
    server = netius.servers.WSGIServer(app = app)
    server.serve(port = 8000)

if os.environ.get("SERVER") == 'waitress':
    from waitress import serve
    serve(app, listen='*:8000')