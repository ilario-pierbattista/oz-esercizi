% La procedura {ForAll Xs P} riceve in input una lista di elementi Xs ed una procedura P.
% Per ogni elemento della lista, attiva la procedura P passandoglielo come argomento.
% ForAll :: (List A) (A)

local
   proc {ForAll Xs P}
      case Xs
      of nil then skip
      [] X|Xr then
	 {P X}
	 {ForAll Xr P}
      end
   end

   L = [1 2 3 4 5 6 7]
in
   {Browse L}
   {ForAll L Browse}
end
