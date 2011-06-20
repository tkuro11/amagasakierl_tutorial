-module(hello).
-export([greeting/0, greeting/1]).

%% you can't put -export after function definition
%% but before you may put as many as you like.
-export([sum/1]).

greeting() -> 
    greeting("Hello World .. commas in sequential"),
    greeting("Hello World .. statements are mandatory"),
    greeting("Hello World .. ugly..."),
    ok.   % it's a TA for silly syntax of Erlang
           % but if your function must return something, it may not work   

greeting(Msg) ->
    io:format("~s~n", [Msg]).


%% it's common idiom for Erlang to define 
%% different arity functions for user convenience

%% this is I/F function
sum(N) ->
    sum(N, 0).

%% these are implementation things
%%  (here, accumerator for  tail recursion)
sum(0, Acc) -> Acc;  %% 'last order' :)
sum(N, Acc) ->
    sum(N-1, Acc + N).

