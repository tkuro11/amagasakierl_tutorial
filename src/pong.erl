-module(pong).
-export([resp/0]).
-export([send/2, loop/0, shutdown/1, start/0]).

%% util funcs
start() ->
    spawn(?MODULE, loop, []).

send(Pid, Msg) ->
    Pid ! {self(), Msg},
    receive
        {Pid, R} -> R;
	_ -> noway     % again this makes copy&paste friendly on above code
    end.

shutdown(Pid) ->
    Pid ! avadaKedavra.

resp() -> 
    receive
        { Pid, ping} -> Pid ! {self(), pong};
        { Pid, pong} -> Pid ! {self(), ping};
	_            -> exit(deadnow)
    end.

loop() ->
    resp(),
    loop().       % infinite loop

%% Pid = spawn(pong, resp, []).
%% process_info(Pid).
%% 
%% receive 
%%   R -> R
%% end.
%% process_info(Pid).
%% Pid2 = spawn(pong, loop, []).   % loop version
