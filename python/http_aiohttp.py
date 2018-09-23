from aiohttp import web

async def handle(request):
    return web.Response(text="Hello, World!")

app = web.Application()
app.add_routes([web.get('/', handle)])

web.run_app(app, port=8000)