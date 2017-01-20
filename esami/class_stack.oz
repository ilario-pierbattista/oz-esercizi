% Scrivere la classe con i metodi pop e push per uno stack

local
   class Stack
      attr
	 S
      meth init
	 S := nil
      end
      meth push(E)
	 S := E|(@S)
      end
      meth pop(Out)
	 case @S
	 of nil then raise error('Empty stack') end
	 [] X|Sr then
	    S := Sr
	    Out = X
	 end
      end
   end

   S E1 E2 E3
in
   S = {New Stack init}
   {Browse S}
   {S push(1)}
   {S push(2)}
   try
      {S pop(E1)}
      {Browse E1}
      {S pop(E2)}
      {Browse E2}
      {S pop(E3)}
      {Browse E3}
   catch error(E) then
      {Browse E}
   end
end

   