% Implementazione dello <Stack T> come ADT
% V: {T, Insieme di tutti gli Stack di valori T, Boolean}
% F:
% * Push :: (<Stack T>) (T) -> (<Stack T>)
% * Pop :: (<Stack T>) (<Stack T>) -> (T)
% * IsEmpty :: (<Stack T>) -> Boolean
% C: NewStack

local
   /* Implementazione con liste
   fun {NewStack}
      nil
   end

   fun {IsEmpty S}
      S == nil
   end

   fun {Push S X}
      X|S
   end

   fun {Pop X|Sr ?Sn}
      Sn = Sr
      X
   end
   */

   % Implementazione con tuple
   fun {NewStack}
      emptyStack
   end

   fun {IsEmpty S}
      S == emptyStack
   end

   fun {Push S E}
      stack(E S)
   end

   fun {Pop S1 ?S2}
      case S1
      of stack(E S) then
	 S2 = S
	 E
      [] emptyStack then
	 raise error('Empty Stack, cannot pop') end
      end
   end
   
in
   local L1 L2 L3 L4 X in
      L1 = {NewStack}
      L2 = {Push L1 3}
      L3 = {Push L2 6}
      X = {Pop L3 L4}
      {Browse L1}
      {Browse {IsEmpty L1}}
      {Browse L2}
      {Browse L3}
      {Browse L4}
      {Browse X}
   end
end

   
   