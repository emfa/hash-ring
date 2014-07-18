-module(hash_ring_app).

-behaviour(application).

-export([start/2,
         stop/1]).

start(_StartType, _StartArgs) ->
    hash_ring_sup:start_link().

stop(_State) ->
    ok.
