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

# Django
python3_django_gunicorn_sync: python3_image
	$(RUN) http_python3 gunicorn http_django:app -w 1 --worker-class=sync
python3_django_gunicorn_eventlet: python3_image
	$(RUN) http_python3 gunicorn http_django:app -w 1 --worker-class=eventlet
python3_django_gunicorn_gevent: python3_image
	$(RUN) http_python3 gunicorn http_django:app -w 1 --worker-class=gevent
python3_django_gunicorn_tornado: python3_image
	$(RUN) http_python3 gunicorn http_django:app -w 1 --worker-class=tornado
python3_django_gunicorn_gthread: python3_image
	$(RUN) http_python3 gunicorn http_django:app -w 1 --worker-class=gthread
python3_django_bjoern: python3_image
	$(RUN) --env SERVER=bjoern http_python3 python -m http_django
python3_django_netius: python3_image
	$(RUN) --env SERVER=netius http_python3 python -m http_django
python3_django_waitress: python3_image
	$(RUN) --env SERVER=waitress http_python3 python -m http_django
python3_django_gunicorn_meinheld: python3_image
	$(RUN) http_python3 gunicorn http_django:app -w 1  --worker-class="egg:meinheld#gunicorn_worker"
pypy3_django_gunicorn_sync: pypy3_image
	$(RUN) http_pypy3 gunicorn http_django:app -w 1 --worker-class=sync

# Falcon
python3_falcon_gunicorn_sync: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=sync
python3_falcon_gunicorn_eventlet: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=eventlet
python3_falcon_gunicorn_gevent: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=gevent
python3_falcon_gunicorn_tornado: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=tornado
python3_falcon_gunicorn_gthread: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1 --worker-class=gthread
python3_falcon_bjoern: python3_image
	$(RUN) --env SERVER=bjoern http_python3 python -m http_falcon
python3_falcon_netius: python3_image
	$(RUN) --env SERVER=netius http_python3 python -m http_falcon
python3_falcon_waitress: python3_image
	$(RUN) --env SERVER=waitress http_python3 python -m http_falcon
python3_falcon_gunicorn_meinheld: python3_image
	$(RUN) http_python3 gunicorn http_falcon:app -w 1  --worker-class="egg:meinheld#gunicorn_worker"
pypy2_falcon_gunicorn_sync: pypy2_image
	$(RUN) http_pypy2 gunicorn http_falcon:app -w 1 --worker-class=sync
pypy2_falcon_gunicorn_meinheld: pypy2_image
	$(RUN) http_pypy2 gunicorn http_falcon:app -w 1 --worker-class="egg:meinheld#gunicorn_worker"
pypy3_falcon_gunicorn_sync: pypy3_image
	$(RUN) http_pypy3 gunicorn http_falcon:app -w 1 --worker-class=sync

# Flask
flask_python2_gunicorn_sync: python2_image
	$(RUN) http_python2 gunicorn http_flask:app -w 1 --worker-class=sync
python3_flask_gunicorn_sync: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=sync
python3_flask_gunicorn_eventlet: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=eventlet
python3_flask_gunicorn_gevent: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=gevent
python3_flask_gunicorn_tornado: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=tornado
python3_flask_gunicorn_gthread: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class=gthread
python3_flask_bjoern: python3_image
	$(RUN) --env SERVER=bjoern http_python3 python -m http_flask
python3_flask_netius: python3_image
	$(RUN) --env SERVER=netius http_python3 python -m http_flask
python3_flask_waitress: python3_image
	$(RUN) --env SERVER=waitress http_python3 python -m http_flask
python3_flask_gunicorn_meinheld: python3_image
	$(RUN) http_python3 gunicorn http_flask:app -w 1 --worker-class="egg:meinheld#gunicorn_worker"
pypy2_flask_gunicorn_sync: pypy2_image
	$(RUN) http_pypy2 gunicorn http_flask:app -w 1 --worker-class=sync
pypy3_flask_gunicorn_sync: pypy3_image
	$(RUN) http_pypy3 gunicorn http_flask:app -w 1 --worker-class=sync

# Japronto
python3_japronto: japronto_image
	$(RUN) http_japronto --script ./http_japronto.py

# Sanic
python3_sanic: python3_image
	$(RUN) http_python3 python -m http_sanic

# Tornado
python3_tornado: python3_image
	$(RUN) http_python3 python -m http_tornado
pypy2_tornado: pypy2_image
	$(RUN) http_pypy2 pypy -m http_tornado

# Vibora
python3_vibora: python3_image
	$(RUN) http_python3 python3 -m http_vibora

# Aio Http
python3_aiohttp: python3_image
	$(RUN) http_python3 python3 -m http_aiohttp
