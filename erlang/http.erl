-module(http).
-export([start/0]).

start() ->
    spawn(fun () -> {ok, Sock} = gen_tcp:listen(8000, [{active, false}]),
                    loop(Sock) end).

loop(Sock) ->
    {ok, Conn} = gen_tcp:accept(Sock),
    Handler = spawn(fun () -> handle(Conn) end),
    gen_tcp:controlling_process(Conn, Handler),
    loop(Sock).

handle(Conn) ->
    gen_tcp:send(Conn, response("Hello, World!")),
    gen_tcp:close(Conn).

response(Str) ->
    B = iolist_to_binary(Str),
    iolist_to_binary(
      io_lib:fwrite(
         "HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: ~p\n\n~s",
         [size(B), B])).
