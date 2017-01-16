% Implementare l'ADT set a partire dalla struttura dati lista
% <Set I> ::= nil | <I>'|'<List I>
% Insert ::= {I <Set I>} -> {Set I}
% IsMember ::= {I <Set I>} -> Boolean
% Union ::= {<Set I> <Set I>} -> {Set I}


local
   % La seguente implementazione non è efficiente
   
   % fun {IsMember E S}
   %    {FoldL S
   %     fun {$ R X}
   % 	  {Or R X==E}
   %     end
   %     false}
   % end

   fun {Insert E S}
      if {Not {IsMember E S}} then
   	 E|S
      else
   	 S
      end
   end

   fun {Union S1 S2}
      {FoldL S1
       fun {$ S2 E}
   	  {Insert E S2}
       end
       S2}
   end

   % Miglioramento dell'efficienza
   fun {IsMember E S}
      case S
      of nil then false
      [] X|Sr then if X==E then true else {IsMember E Sr} end
      end
   end
in
   {Browse {Insert 1 [5 3 8]}}
   {Browse {Insert 5 [5 3 8]}}
   {Browse {IsMember 2 [3 6 2 7]}}
   {Browse {Union [1 4 7] [4 7 2]}}
end
