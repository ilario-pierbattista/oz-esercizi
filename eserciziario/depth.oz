% Depth calcola la profondità massima dell'albero.
% tree(val left_tree right_tree)
% albero vuoto -> nil 

local
   fun {Depth T}
      case T
      of nil then 0
      [] tree(_ LT RT) then
	 {Max {Depth LT} {Depth RT}} + 1
      end
   end
in
   {Browse {Depth tree(a tree(b nil tree(c nil nil)) tree(d nil nil))}}
end
