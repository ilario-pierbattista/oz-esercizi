% Implementazione dell'append logico
% Logica semantica:
% Forall a,b,c(append(a,b,c) <->
%       (a = nil and c = b) or
%       (Exists x,y,z(a = x|y and x = x|z and append(y b z)))
% )
%
% Logica operazionale:

local
   proc {Append A B C}
      choice
	 A = nil B = C
      [] As Cs X in
	 A = X|As C = X|Cs {Append As B Cs}
      end
   end
in
   % Eseguirne uno alla volta
   %{ExploreAll fun{$} S in {Append [1] [2 3] S} S end}
   {ExploreAll fun{$} S in {Append S [2 3] [1 2 3]} S end}
   %{ExploreAll fun{$} A B in {Append A B [1 2 3]} [A B] end}
end

   
	 