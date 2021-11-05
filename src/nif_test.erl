-module(nif_test).
-on_load(init/0).
-export([now/0]).
-export([square/1]).

-define(APPNAME, nif_test).
-define(LIBNAME, nif_test).

%%====================================================================
%% API functions
%%====================================================================

now() -> nif_not_loaded.

square(_X) -> nif_not_loaded.

% bar(_X) -> nif_not_loaded.

%%====================================================================
%% Internal functions
%%====================================================================

init() ->
    SoName = case code:priv_dir(?APPNAME) of
        {error, bad_name} ->
            case filelib:is_dir(filename:join(["..", priv])) of
                true -> filename:join(["..", priv, ?LIBNAME]);
                _ -> filename:join([priv, ?LIBNAME])
            end;
        Dir -> filename:join(Dir, ?LIBNAME)
    end,
    erlang:load_nif(SoName, 0).

% init() ->
%     ok = erlang:load_nif("priv/nif_test", 0).