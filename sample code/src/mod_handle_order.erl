                                                                                       
-module(mod_handle_order).
-behaviour(gen_mod).
%% Required by ?INFO_MSG macros
-include("logger.hrl").
%% Required by ?T macro
-include("translate.hrl").
%% gen_mod API callbacks
-export([start/2, stop/1, depends/2, mod_options/1, process_local_iq/1, mod_doc/0]).
-record(handle_order, {x = <<>> :: binary()}).
-type handle_order() :: #handle_order{}.
start(_Host, _Opts) ->
    ?INFO_MSG("Hello, ejabberd world!", []),
    xmpp:register_codec(handle_order),
    gen_iq_handler:add_iq_handler(ejabberd_local, _Host, <<"ns:handle_order">>, ?MODULE, process_local_iq),
    ok.
stop(_Host) ->
    ?INFO_MSG("Bye bye, ejabberd world!", []),
    xmpp:unregister_codec(handle_order),
    gen_iq_handler:remove_iq_handler(ejabberd_local, _Host, <<"ns:handle_order">>),
    ok.
depends(_Host, _Opts) ->
    [].
mod_options(_Host) ->
    [].
process_local_iq(IQ) ->
    ?INFO_MSG("Custom magilic IQ received:~p", [IQ]),
    ignore.
mod_doc() ->
    #{desc =>
          ?T("This is an example module.")