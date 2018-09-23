RUN=docker run --network host --rm --cpuset-cpus="0" --cpus=1
include erlang/Makefile
include golang/Makefile
include haskell/Makefile
include node/Makefile
include python/Makefile
include rust/Makefile

all_images: python3_image python2_image pypy3_image pypy3_image golang_image japronto_image rust_image

benchmark_1:
	docker run --rm --net=host --cpuset-cpus="1" 1vlad/wrk2-docker -t1 -c10 -d30s -R100 --latency http://127.0.0.1:8000 | grep 'Latency Distribution\|Requests' -A 8

benchmark_2:
	docker run --rm --net=host --cpuset-cpus="1" 1vlad/wrk2-docker -t1 -c100 -d30s -R1000 --latency http://127.0.0.1:8000 | grep 'Latency Distribution\|Requests' -A 8

benchmark_3:
	docker run --rm --net=host --cpuset-cpus="1,2" 1vlad/wrk2-docker -t2 -c1000 -d300s -R10000 --latency http://127.0.0.1:8000 | grep 'Latency Distribution\|Requests' -A 8
