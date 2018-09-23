import falcon


class HelloResource:
    def on_get(self, req, resp):
        resp.body = 'Hello World!'


app = falcon.API()
app.add_route('/', HelloResource())

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
