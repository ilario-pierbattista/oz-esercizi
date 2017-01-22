% Funzione {ContLung L} prende in input una lista di stringhe e restituisce
% una lista di elementi composti dalla tupla, in notazione infissa, stringa#lunghezza

local
   fun {ContLung L}
      {Map L
       fun {$ E}
	  E#{FoldL E
	   fun {$ R _}
	      R+1
	   end
	   0}
       end}
   end
in
   {Browse {ContLung ["ciao" "mondo" "questo" "è" "oz/mozart"]}}
end
