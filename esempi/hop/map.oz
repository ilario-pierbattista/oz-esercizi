% {Map Xs F}
% Funzione del primo ordine: riceve in input una lista di elementi Xs ed una funzione F,
% produce in output una lista ottenuta a partire dagli stessi elementi di Xs, trasformati
% dall'applicazione della funzione F.
% Map ::= <List T>,<F> -> <List T>
% F ::= <T> -> <T>

local
   fun {Map Xs F}
      case Xs
      of nil then nil
      [] X|Xr then {F X}|{Map Xr F}
      end
   end

   fun {Operator X}
      X*X
   end

   L1 L2
in
   L1 = [1 2 3 4 5]
   L2 = {Map L1 Operator}
   {Browse L1}
   {Browse L2}
end