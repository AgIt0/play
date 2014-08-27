-module(day3).
-export([doctor_loop/0, loop/0, translate/2]).

%% Monitor the translate_service and restart it should it die and make the Doctor monitor itself.
doctor_loop() ->
    process_flag(trap_exit, true), 
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(translator, spawn_link(fun day3:loop/0)),
            doctor_loop();
        {'EXIT', From, Reason} -> 
          case Reason of
            {translate,_,_,_,_} ->
              io:format("The translate service ~p died with reason ~p.", [From, Reason]),
              io:format(" Restarting. ~n"),
              self() ! new,
              loop();

            _ ->
              io:format("The doctor service ~p died with reason ~p.", [From, Reason]),
              io:format(" Restarting. ~n"),
              exit(whereis(translator), translator),
              Doctor = spawn(fun day3:doctor_loop/0),
              Doctor ! new
          end
        end.

loop() ->
  receive
    {From, "casa"} -> 
      From ! "house", 
      loop();

    {From, "blanca"} -> 
      From ! "white", 
      loop();

    {From, _} -> 
      From ! "I don't understand.", 
      exit({translate,service,die,at,erlang:time()})
  end.

translate(To, Word) ->
  To ! {self(), Word}, 
  receive
    Translation -> Translation
  end.
