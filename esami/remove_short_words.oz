% Funzione {RemoveShortWords L K} che elimina le parole più lunghe di K in L

local
   fun {RemoveShortWords L K}
      {Filter L
       fun {$ E}
	  {Length E} < K
       end}
   end

   Text = ["Hello" "this" "is" "an" "oz" "program"]
in
   {Browse Text}
   {Browse {RemoveShortWords Text 3}}
end
