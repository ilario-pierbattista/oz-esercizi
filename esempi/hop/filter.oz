% {Filter Xs F}
% Funzione di ordine 1: riceve in input una lista di elementi Xs ed una funzione F;
% produce in output una lista di elementi creata partire da quella in input, selezionando
% gli elementi che, dati come input alla funzione F, producono true come risultato.
% Filter :: (List A) (A -> Boolean) -> (List A)

local
   fun {Filter Xs F}
      case Xs
      of nil then nil
      [] X|Xr then
	 if {Condition X} then
	    X|{Filter Xr F}
	 else
	    {Filter Xr F}
	 end
      end
   end

   fun {Condition X}
      {Int.isEven X}
   end

   L1 L2
in
   L1 = [1 2 3 4 5 6 7]
   L2 = {Filter L1 Condition}
   {Browse L1}
   {Browse L2}
end
