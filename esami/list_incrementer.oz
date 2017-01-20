% Instantiation: scrivere una funzione che ritorna un incrementatore
% che in ingresso accetta una lista, incrementandone tutti gli elementi

local
   fun {ListIncrementer Step} I in
      I = fun {$ Xs}
	     case Xs
	     of nil then nil
	     [] X|Xr then (X+Step)|{I Xr}
	     end
	  end
      I
   end

   L1 = [1 2 3 4 5 6 7]
   L2 Inc
in
   {Browse L1}
   {Browse ListIncrementer}
   Inc = {ListIncrementer 2}
   {Browse Inc}
   L2 = {Inc L1}
   {Browse L2}
end
