% Embedding: possibilità di inserire procedure values in delle strutture dati

local
   Algebra
in
   local
      fun {Add X Y}
	 X+Y
      end

      fun {Sub X Y}
	 X-Y
      end

      fun {Mult X Y}
	 X*Y
      end

      fun {Div X Y}
	 X/Y
      end
   in
      Algebra = op(add:Add
		   sub:Sub
		   mult:Mult
		   divd:Div
		  )
   end

   {Browse 3}
   {Browse 5}
   {Browse {Algebra.add 3 5}}
   {Browse {Algebra.sub 3 5}}
   {Browse {Algebra.mult 3 5}}
   {Browse {Algebra.divd 3 5}}
end
