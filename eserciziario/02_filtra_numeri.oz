% La funzione FiltraNumeri prende in input una lista di interi e produce in output
% la stessa lista, con le occorrenze dei valodi 1 3 5 7 sostituite dalla stringa "X".
% Utilizzare {Map Xs F}

local
   fun {FiltraNumeri L}
      {Map L
       fun {$ E}
	  Tag = "X"
       in
	  case E
	  of 1 then Tag
	  [] 3 then Tag
	  [] 5 then Tag 
	  [] 7 then Tag
	  else E
	  end
       end
      }
   end
in
   {Browse {FiltraNumeri [12 4 3 6 32 7]}}
end
