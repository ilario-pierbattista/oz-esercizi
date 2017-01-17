% Implementazione della funzione di folding (sfogliare) di una lista per applicare
% lo stesso operatore (associativo a destra) a tutti i suoi elementi.
% {FoldR Xs F S}
% {F R X} è l'operatore da applicare con due argomenti, il risultato parziale R e
% l'elemento corrente della lista X
% FoldR :: (List A) ((C A) -> B) C -> C

local
   fun {FoldR Xs F S}
      Partial
   in
      case Xs
      of nil then
	 {Browse 'Caso Base'}
	 S
      [] X|Xr then
	 {Browse 'Andata:'}
	 {Browse Xs}
	 Partial = {FoldR Xr F S}
	 {Browse 'Ritorno:'}
	 {Browse Partial}
	 {F Partial X}
      end
   end

   L1 Sum
in
   L1 = [1 2 3 4 5 6 7 8]
   Sum = {FoldR L1
	  fun {$ R X}
	     R+X
	  end
	  0}
   {Browse L1}
   {Browse Sum}
end
