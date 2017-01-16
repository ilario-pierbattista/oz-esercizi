% La funzione Zip prende in input una tupla Z=Xs#Ys composta da due liste Xs ed Ys e produce
% in output una lista di tuple XYs=[X1#Y1 ... Xn#Yn]. Nel caso in cui le liste siano di
% lunghezza diversa, si generi un messaggio di errore.

local
   fun {Zip Z}
      case Z
      of nil#nil then nil
      [] (X|Xr)#nil then raise errore('Errore - La seconda lista è troppo corta') end
      [] nil#(Y|Ys) then raise errore('Errore - La prima lista è troppo corta') end
      [] (X|Xr)#(Y|Yr) then
	 XYr
      in
	 XYr = {Zip Xr#Yr}
	 X#Y|XYr
      end
   end
in
   try {Browse {Zip [a b c]#[1 2 3]}}
   catch errore(E) then {Browse E} end
   try {Browse {Zip [a b]#[1 2 3]}}
   catch errore(E) then {Browse E} end
   try {Browse {Zip [a b c]#[1 2]}}
   catch errore(E) then {Browse E} end
end
