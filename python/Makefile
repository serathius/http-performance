python3_image:
	docker build -f python/Dockerfile_python3 -t http_python3 python
python2_image:
	docker build -f python/Dockerfile_python2 -t http_python2 python
pypy2_image:
	docker build -f python/Dockerfile_pypy2 -t http_pypy2 python
pypy3_image:
	docker build -f python/Dockerfile_pypy3 -t http_pypy3 python
japronto_image:
	docker build -f python/Dockerfile_japronto -t http_japronto python

# Falcon
falcon_python3_gunicorn_sync: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=sync
falcon_python3_gunicorn_eventlet: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=eventlet
falcon_python3_gunicorn_gevent: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=gevent
falcon_python3_gunicorn_tornado: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=tornado
falcon_python3_gunicorn_gthread: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=gthread
falcon_python3_bjoern: python3_image
	$(RUN) --env SERVER=bjoern http_python3 python -m http_falcon
falcon_python3_netius: python3_image
	$(RUN) --env SERVER=netius http_python3 python -m http_falcon
falcon_python3_waitress: python3_image
	$(RUN) --env SERVER=waitress http_python3 python -m http_falcon
falcon_python3_gunicorn_meinheld: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1  --worker-class="egg:meinheld#gunicorn_worker"
falcon_pypy2_gunicorn_sync: pypy2_image
	$(RUN) http_pypy2 gunicorn http_falcon:app -w 1 --worker-class=sync
falcon_pypy2_gunicorn_meinheld: pypy2_image
	$(RUN) http_pypy2 gunicorn http_falcon:app -w 1 --worker-class="egg:meinheld#gunicorn_worker"
falcon_pypy3_gunicorn_sync: pypy3_image
	$(RUN) http_pypy3 gunicorn http_falcon:app -w 1 --worker-class=sync

# Flask
flask_python2_gunicorn_sync: python2_image
	$(RUN) http_python2 gunicorn http_flask:app -w 1 --worker-class=sync
flask_python3_gunicorn_sync: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=sync
flask_python3_gunicorn_eventlet: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=eventlet
flask_python3_gunicorn_gevent: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=gevent
flask_python3_gunicorn_tornado: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=tornado
flask_python3_gunicorn_gthread: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=gthread
flask_python3_bjoern: python3_image
	$(RUN) --env SERVER=bjoern http_python3 python -m http_flask
flask_python3_netius: python3_image
	$(RUN) --env SERVER=netius http_python3 python -m http_flask
flask_python3_waitress: python3_image
	$(RUN) --env SERVER=waitress http_python3 python -m http_flask
flask_python3_gunicorn_meinheld: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class="egg:meinheld#gunicorn_worker"
flask_pypy2_gunicorn_sync: pypy2_image
	$(RUN) http_pypy2 gunicorn http_flask:app -w 1 --worker-class=sync
flask_pypy3_gunicorn_sync: pypy3_image
	$(RUN) http_pypy3 gunicorn http_flask:app -w 1 --worker-class=sync

# Japronto
japronto_python3: japronto_image
	$(RUN) http_japronto python -m http_japronto

# Sanic
sanic_python3: python3_image
	$(RUN) http_python3 python -m http_sanic

# Tornado
tornado_python3: python3_image
	$(RUN) http_python3 python -m http_tornado
tornado_pypy2: pypy2_image
	$(RUN) http_pypy2 pypy -m http_tornado

# Vibora
vibora_python3: python3_image
	$(RUN) http_python3 python3 -m http_vibora

# Aio Http
aiohttp_python3: python3_image
	$(RUN) http_python3 python3 -m http_aiohttp
