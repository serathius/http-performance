all_images: python3_image python2_image pypy3_image pypy3_image golang_image japronto_image rust_image
RUN=docker run --network host --rm --cpus=1

python3_image:
	docker build -f python/Dockerfile_python3 -t http_python3 python

python2_image:
	docker build -f python/Dockerfile_python2 -t http_python2 python

pypy2_image:
	docker build -f python/Dockerfile_pypy2 -t http_pypy2 python

pypy3_image:
	docker build -f python/Dockerfile_pypy3 -t http_pypy3 python

golang_image:
	docker build -t http_golang golang

japronto_image:
	docker build -f python/Dockerfile_japronto -t http_japronto python

rust_image:
	docker build -t http_rust rust

node_image:
	docker build -t http_node node

erlang_image:
	docker build -t http_erlang erlang

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

golang_net_http: golang_image
	$(RUN) http_golang net_http

golang_fasthttp: golang_image
	$(RUN) http_golang fasthttp

tornado_python3: python3_image
	$(RUN) http_python3 python -m http_tornado

tornado_pypy2: pypy2_image
	$(RUN) http_pypy2 pypy -m http_tornado

hyper_rust: rust_image
	$(RUN) http_rust http_hyper/target/debug/http_hyper

node: node_image
	$(RUN) http_node node http.js

erlang: erlang_image
	$(RUN) http_erlang erl http.erl

haskell:
	cd haskell && stack run

profile:
	wrk -t 3 -c 3 -d 30s http://localhost:8000

.PHONY: python3_image python2_image pypy2_image pypy3_image golang_image haskell
clean:
	docker rmi -f falcon