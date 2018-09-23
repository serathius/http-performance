RUN=docker run --network host --rm --cpus=1
include erlang/Makefile
include golang/Makefile
include haskell/Makefile
include node/Makefile
include python/Makefile
include rust/Makefile

all_images: python3_image python2_image pypy3_image pypy3_image golang_image japronto_image rust_image

profile:
	wrk -t 3 -c 3 -d 30s http://localhost:8000
