RUN=docker run --network host --rm --cpuset-cpus="0" --cpus=1
include erlang/Makefile
include golang/Makefile
include haskell/Makefile
include node/Makefile
include python/Makefile
include rust/Makefile
include java/Makefile

all_images: python3_image python2_image pypy3_image pypy3_image golang_image japronto_image rust_image
EXTRACT_SHORT=awk '{print $$2}' | sed 's/[^0-9^.]*//g'
EXTRACT_DATA=grep 'Latency Distribution\|Requests' -A 8
SCENARIO_1=-t1 -c10 -d30s -R100 --latency
SCENARIO_2=-t1 -c100 -d30s -R1000 --latency
SCENARIO_3=-t2 -c1000 -d300s -R10000 --latency
HELLO_ENDPOINT=http://127.0.0.1:8000/
WORK_ENDPOINT=http://127.0.0.1:8000/work
SLEEP_ENDPOINT=http://127.0.0.1:8000/sleep
TRANSFER_ENDPOINT=http://127.0.0.1:8000/transfer
RUN_BENCHMARK=docker run --rm --net=host

benchmark_1_hello:
	$(RUN_BENCHMARK) --cpuset-cpus="1" 1vlad/wrk2-docker $(SCENARIO_1) $(HELLO_ENDPOINT) | $(EXTRACT_DATA) | $(EXTRACT_SHORT)
benchmark_1_sleep:
	$(RUN_BENCHMARK) --cpuset-cpus="1" 1vlad/wrk2-docker $(SCENARIO_1) $(SLEEP_ENDPOINT) | $(EXTRACT_DATA) | $(EXTRACT_SHORT)
benchmark_1_work:
	$(RUN_BENCHMARK) --cpuset-cpus="1" 1vlad/wrk2-docker $(SCENARIO_1) $(WORK_ENDPOINT) | $(EXTRACT_DATA) | $(EXTRACT_SHORT)
benchmark_1_transfer:
	$(RUN_BENCHMARK) --cpuset-cpus="1" 1vlad/wrk2-docker $(SCENARIO_1) $(TRANSFER_ENDPOINT) | $(EXTRACT_DATA) | $(EXTRACT_SHORT)

benchmark_2_hello:
	$(RUN_BENCHMARK) --cpuset-cpus="1" 1vlad/wrk2-docker $(SCENARIO_2) $(HELLO_ENDPOINT) | $(EXTRACT_DATA) | $(EXTRACT_SHORT)

benchmark_3_hello:
	$(RUN_BENCHMARK) --cpuset-cpus="1,2" 1vlad/wrk2-docker $(SCENARIO_3) $(HELLO_ENDPOINT) | $(EXTRACT_DATA) | $(EXTRACT_SHORT)
