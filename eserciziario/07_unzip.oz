% La funzione UnZip riceve in input una lista di tuple X#Y e restituisce una tupla Xs#Ys
% composta dalla lista degli elementi a sinistra e a destra delle tuple di input.

local
   fun  {UnZip XYs}
      case XYs
      of nil then nil#nil
      [] X#Y|XYr then
	 Xr Yr
      in
	 Xr#Yr = {UnZip XYr}
	 (X|Xr)#(Y|Yr)
      end
   end
in
   {Browse {UnZip [a#4 b#2 c#6]}}
end
