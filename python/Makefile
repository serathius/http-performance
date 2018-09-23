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

falcon_python3_gunicorn_sync: python3_image
	 http_python3 gunicorn http_falcon:app

falcon_pypy2_gunicorn_sync: pypy2_image
	$(RUN) http_pypy2 gunicorn http_falcon:app

falcon_pypy3_gunicorn_sync: pypy3_image
	$(RUN) http_pypy3 gunicorn http_falcon:app

japronto_python3: japronto_image
	$(RUN) http_japronto python -m http_japronto

sanic_python3: python3_image
	$(RUN) http_python3 python -m http_sanic

tornado_python3: python3_image
	$(RUN) http_python3 python -m http_tornado

tornado_pypy2: pypy2_image
	$(RUN) http_pypy2 pypy -m http_tornado

vibora_python3: python3_image
	$(RUN) http_python3 python3 -m http_vibora

aiohttp_python3: python3_image
	$(RUN) http_python3 python3 -m http_aiohttp
