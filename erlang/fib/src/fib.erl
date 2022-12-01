-module(fib).
-behaviour(application).

-export([start/2,stop/1]).

start(_Type, _Args) ->
    fib(0, 1).

stop(_State) ->
    ok.

fib(X, Y) ->
    T = erlang:monotonic_time(),
    case T rem 1000 of
        0 ->
            io:format("~p~n", [X]),
            fib(Y, X + Y);
        _ ->
            fib(X, Y)
    end.
