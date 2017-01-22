% Funzione unzip prende in input una lista di elementi X#Y e restituisce due liste,
% una con gli elementi X ed una con gli elementi Y

local
   fun {Unzip XYs}
      case XYs
      of nil then nil#nil
      [] (X#Y)|XYr then Xr Yr in
	 Xr#Yr = {Unzip XYr}
	 (X|Xr)#(Y|Yr)
      end
   end
in
   {Browse {Unzip [1#a 2#b 3#c]}}
end
