% Risoluzione del problema delle N-Regine utilizzando il modello di programmazione
% relazionale messo a disposizione da OZ.
% Risoluzione dell'istanza a 4 regine
% La posizione delle regine viene rappresentata con una lista di quattro elementi:
% L'indice dell'elemento rappresenta la riga, il valore la colonna.
% In questo modo il vincolo per cui due regine non possano trovarsi sulla stessa riga
% è implicitamente verificato

local
   fun {Queens4}
      local
	 % Generazione della possibile soluzione
	 fun {Pos}
	    choice 1 [] 2 [] 3 [] 4 end
	 end
	 Solution = [{Pos} {Pos} {Pos} {Pos}]

	 % Vincoli
	 fun {CheckCols Cs}
	    case Cs
	    of nil then true
	    [] C|Cr then {Not {Member C Cr}} andthen {CheckCols Cr}
	    end
	 end

	 fun {CheckDiags Cs}
	    fun {CheckSingleDiags S R}
	       case S
	       of _|nil then true
	       [] H|H1|T then
		  (H-R<1 orelse H1 \= H-R) andthen
		  (H+R>4 orelse H1 \= H+R) andthen
		  {CheckSingleDiags H|T R+1}
	       end
	    end
	 in
	    case Cs
	    of nil then true
	    [] _|Cr then {CheckSingleDiags Cs 1} andthen {CheckDiags Cr}
	    end
	 end
	    
      in
	 if {Not {CheckCols Solution}} then fail end
	 if {Not {CheckDiags Solution}} then fail end
	 Solution
      end
   end

   S
in
   S = {Search.base.all
	proc {$ ?Y}
	   Y = {Queens4}
	end}
   {Browse S}
   {ExploreAll Queens4}
end
