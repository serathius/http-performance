erlang_image:
	docker build -t http_erlang erlang

erlang: erlang_image
	$(RUN) http_erlang erl -noshell -s http start
