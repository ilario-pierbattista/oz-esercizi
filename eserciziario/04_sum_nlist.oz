% Riceve in input una lista di liste di interi e produce in output la somma
% degli elementi di tali liste.

local
   fun {SumNList NL}
      {FoldL NL
       fun {$ Sum Element}
	  case Element
	  of nil then Sum
	  [] _|_ then Sum + {SumNList Element}
	  else Sum + Element
	  end
       end
       0
      }
   end
in
   {Browse {SumNList [[1 2] 4 nil [[5] 10]]}}
end
