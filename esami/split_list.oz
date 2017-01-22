% Funzione split che divide la lista in due a partire dalla posizione N

local
   fun {Split Xs N}
      case Xs
      of nil then nil
      [] X|Xr then
	 if N == 1 then (X|nil)#Xr
	 else T1 L2 in
	    T1#L2 = {Split Xr N-1}
	    (X|T1)#L2
	 end
      end	    
   end
in
   {Browse {Split [1 2 3 4 5 6 7 8] 4}}
end
