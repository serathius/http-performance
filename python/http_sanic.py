from sanic import Sanic
from sanic import response

app = Sanic()

@app.route("/")
async def test(request):
    return response.text('Hello world!')


if __name__ == "__main__":
    app.run(log_config=None, debug=False, access_log=False)