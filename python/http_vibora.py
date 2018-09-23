from vibora import Vibora, Request
from vibora.responses import Response

app = Vibora()


@app.route('/')
async def home(request: Request):
    return Response(b'Hello, World!')


if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=8000, workers=1)