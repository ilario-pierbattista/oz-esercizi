% Codificare la funzione Zip che prende in input due liste di eguale lunghezza e restituisce la lista
% di elementi composta dalle tuple X#Y, con X ed Y elementi delle liste di partenza

local
   fun {Zip Xs Ys}
      case Xs#Ys
      of nil#nil then nil
      [] nil#(Y|Yr) then raise error('Prima lista troppo corta') end
      [] (X|Xr)#nil then raise error('Seconda lista troppo corta') end
      [] (X|Xr)#(Y|Yr) then
	 (X#Y)|{Zip Xr Yr}
      end
   end

in
   {Browse {Zip [a b c] [1 2 3]}}
   try
      {Browse {Zip [a b] [1 2 3]}}
   catch error(E) then
      {Browse E}
   end

   try
      {Browse {Zip [a b c] [1 2]}}
   catch error(E) then
      {Browse E}
   end
end
