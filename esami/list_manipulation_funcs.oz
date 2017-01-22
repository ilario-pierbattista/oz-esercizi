% Date una lista di interi L ed un intero N codificare
% * {Trunk L N} -> restituisce i primi N elementi della lista
% * {Trampling L N} -> restituisce, se gli elementi di L sono meno di N, una lista
% formata da L con degli zeri in testa per raggiungere la lunghezza giusta

local
   fun {Trunk L N}
      case L
      of nil then nil
      [] X|Xr andthen N > 0 then X|{Trunk Xr N-1}
      [] X|Xr andthen N == 0 then nil
      end
   end

   fun {Trampling L N}
      fun {Padder N Digit List}
	 if N > 0 then Digit|{Padder N-1 Digit List}
	 else List end 
      end
   in
      {Padder (N-{Length L}) 0 L}
   end
in
   {Browse {Trunk [1 2 3 4] 2}}
   {Browse {Trampling [1 2] 6}}
end
