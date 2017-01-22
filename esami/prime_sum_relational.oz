% Usando il modello di programmazione relazionale, generare tutte le combinazioni delle cifre
% 0 3 5 7, tali che la loro somma dia un numero primo

local
   fun {PrimeSum}
      fun {Place}
	 choice 0 [] 3 [] 5 [] 7 end
      end

      fun {CheckPrime S}
	 fun {PrimeTest Divisor Number}
	    if Divisor == 1 then true
	    elseif Number mod Divisor == 0 then false
	    else {PrimeTest Divisor-1 Number}
	    end
	 end
	 Sum
      in
	 case S
	 of X|Y|Z|W|nil then
	    Sum = X + Y + Z + W
	    {PrimeTest Sum-1 Sum}
	 else raise error('Struttura non supportata' # S) end
	 end
      end
      
      Sol
   in
      Sol = [{Place} {Place} {Place} {Place}]
      if {Not {CheckPrime Sol}} then fail
      else Sol end
   end
in
   try
      % {ExploreAll PrimeSum}
      {Browse {Search.base.all proc {$ ?Y} Y = {PrimeSum} end}}
   catch error(E) then
      {Browse E}
   end
end
