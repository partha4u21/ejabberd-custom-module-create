-record(handle_order, {x = <<>> :: binary()}).
-type handle_order() :: #handle_order{}.

-type xmpp_element() :: handle_order().
root@ip-172-31-16-249:/opt/ejabberd/.ejabberd-modules/sources/mod_handle_order/src# cat handle_order.erl
%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(handle_order).

-compile(export_all).

do_decode(<<"handle_order">>, <<"ns:handle_order">>, El,
          Opts) ->
    decode_handle_order(<<"ns:handle_order">>, Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() -> [{<<"handle_order">>, <<"ns:handle_order">>}].

do_encode({handle_order, _} = Handle_order, TopXMLNS) ->
    encode_handle_order(Handle_order, TopXMLNS).

do_get_name({handle_order, _}) -> <<"handle_order">>.

do_get_ns({handle_order, _}) -> <<"ns:handle_order">>.

pp(handle_order, 1) -> [x];
pp(_, _) -> no.

records() -> [{handle_order, 1}].

decode_handle_order(__TopXMLNS, __Opts,
                    {xmlel, <<"handle_order">>, _attrs, _els}) ->
    X = decode_handle_order_attrs(__TopXMLNS,
                                  _attrs,
                                  undefined),
    {handle_order, X}.

decode_handle_order_attrs(__TopXMLNS,
                          [{<<"x">>, _val} | _attrs], _X) ->
    decode_handle_order_attrs(__TopXMLNS, _attrs, _val);
decode_handle_order_attrs(__TopXMLNS, [_ | _attrs],
                          X) ->
    decode_handle_order_attrs(__TopXMLNS, _attrs, X);
decode_handle_order_attrs(__TopXMLNS, [], X) ->
    decode_handle_order_attr_x(__TopXMLNS, X).

encode_handle_order({handle_order, X}, __TopXMLNS) ->
    __NewTopXMLNS =
        xmpp_codec:choose_top_xmlns(<<"ns:handle_order">>,
                                    [],
                                    __TopXMLNS),
    _els = [],
    _attrs = encode_handle_order_attr_x(X,
                                        xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
                                                                   __TopXMLNS)),
    {xmlel, <<"handle_order">>, _attrs, _els}.

decode_handle_order_attr_x(__TopXMLNS, undefined) ->
    <<>>;
decode_handle_order_attr_x(__TopXMLNS, _val) -> _val.

encode_handle_order_attr_x(<<>>, _acc) -> _acc;
encode_handle_order_attr_x(_val, _acc) ->
    [{<<"x">>, _val} | _acc].
