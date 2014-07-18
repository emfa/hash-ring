-module(hash_ring_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    InitState = {
      {one_for_all, 5, 10},
      [
       {hash_ring,
        {hash_ring, start_link, []},
        permanent, 5000, worker, [hash_ring]}
      ]
     },
    {ok, InitState}.
