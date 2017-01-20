% Funzione che prende in input una lista e restituisce una funzione
% che, prendendo in input una seconda lista, restituisce la lista degli
% elementi della seconda che non compaiono nella lista

local
   fun {ListDifferencer BaseList}
      fun {IsMember Xs Y}
	 case Xs
	 of nil then false
	 [] X|Xr then if X==Y then true else {IsMember Xr Y} end
	 end
      end

      fun {SpecializedDiffer L1 L2}
	 case L2
	 of nil then nil
	 [] X|Xr then
	    if {IsMember L1 X} then
	       {SpecializedDiffer L1 Xr}
	    else
	       X|{SpecializedDiffer L1 Xr}
	    end
	 end
      end
   in
      fun {$ L2}
	 {SpecializedDiffer L1 L2}
      end
   end

   L1 = [2 4 6 8]
   L2 = [1 2 3 4 5 6 7 8]
   L1Differencer
in
   {Browse L1}
   {Browse L2}
   L1Differencer = {ListDifferencer L1}
   {Browse L1Differencer}
   {Browse {L1Differencer L2}}
end

   