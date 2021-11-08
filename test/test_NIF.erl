-module(test_NIF).
-include_lib("eunit/include/eunit.hrl").

-export([square_test/0]).

square_test() ->
    io:format("Testing square function ~n"),
    ?assert(nif_test:square(1) =:= 1),
    ?assert(nif_test:square(2) =:= 4),
    ?assert(nif_test:square(3) =:= 9),
    ?assert(nif_test:square(4) =:= 16).

