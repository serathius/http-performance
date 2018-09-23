golang_image:
	docker build -t http_golang golang

golang_net_http: golang_image
	$(RUN) http_golang net_http

golang_fasthttp: golang_image
	$(RUN) http_golang fasthttp
