% ContLung riceve una lista di stringhe in input e produce una lista di tuple P#D (P: stringa,
% D: conto dei caratteri).

local
   fun {ContLung L}
      fun {ContaCaratteri Stringa}
	 D
      in
	 D = {FoldL Stringa
	  fun {$ Acc Carattere}
	     Acc+1
	  end
	  0
	     }
	 Stringa#D
      end
   in
      {Map L ContaCaratteri}
   end
in
   {Browse {ContLung ["lui" "e" "loro"]}}
end
