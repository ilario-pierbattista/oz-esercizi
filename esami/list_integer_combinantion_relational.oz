% Usare la programmzione relazionale per individuare tutte le liste di 4 elementi
% in cui gli elementi sono esclusivamente gli interi 0 1 2 3 in modo tale che ci sia
% sempre un numero pari di 1

local
   fun {ListParity}
      fun {Place} choice 0 [] 1 [] 2 [] 3 end end

      fun {CheckOnesParity L}
	 fun {P L C}
	    case L
	    of nil then C mod 2 == 0
	    [] X|Xr andthen X==1 then {P Xr C+1}
	    [] X|Xr andthen X\=1 then {P Xr C}
	    end
	 end
      in
	 {P L 0}
      end
      L
   in
      L = [{Place} {Place} {Place} {Place}]
      if {Not {CheckOnesParity L}} then fail
      else L
      end
   end
in
   % {ExploreAll ListParity}
   {Browse {Search.base.all proc {$ ?Y} Y = {ListParity} end}}
end
