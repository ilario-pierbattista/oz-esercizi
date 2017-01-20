% Scrivere una funzione che, dato in input un albero, restituisca la lista delle sue foglie

local
   fun {ListLeaves T}
      case T
      of leaf then nil
      [] tree(val:V left:leaf right:leaf) then [V]
      [] tree(val:_ left:LT right:RT) then
	 {Append {ListLeaves LT} {ListLeaves RT}}
      end
   end

   T = tree(val:a
	    left:tree(val:b
		      left:leaf
		      right:tree(val:c
				 left:leaf
				 right:leaf
				)
		     )
	    right:tree(val:d
		       left:leaf
		       right:leaf
		      )
	   )
in
   {Browse T}
   {Browse {ListLeaves T}}
end
