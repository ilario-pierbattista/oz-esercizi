% ADT Dizionario
% V: T, Insieme dei dizionari di field T, Insieme delle feature, Boolean
% F:
% * DictMember:: (<Dict T>) (Atom) -> (Bool)
% * DictAccess:: (<Dict T>) (Atom) -> (T)
% * DictAdjoin:: (<Dict T>) (Atom) (T) -> (<Dict T>)
% * DictRemove:: (<Dict T>) (Atom) -> (<Dict T>)
% C: EmptyDict

local
   /* Implementazione con liste
   fun {NewDict} nil end
   fun {DictMember D E}
      case D
      of nil then false
      [] K#V|Dr then if K==E then true else {DictMember Dr E} end
      end
   end
   fun {DictAccess D F}
      case D
      of nil then raise error('Key not found') end
      [] K#V|Dr then if K == F then V else {DictAccess Dr F} end
      end
   end
   fun {DictAdjoin D K V}
      case D
      of nil then [K#V]
      [] Kd#Vd|Dr then
	 if Kd == K then 
	    K#V|Dr
	 else
	    Kd#Vd|{DictAdjoin Dr K V}
	 end
      end
   end
   fun {DictRemove D F}
      case D
      of nil then raise error('Key not found') end
      [] K#V|Dr then
	 if K == F then Dr
	 else K#V|{DictRemove Dr F}
	 end
      end
   end
   */

   /* Implementazione con tuple
   fun {NewDict} emptyDict end
   fun {DictMember D F}
      case D
      of emptyDict then false
      [] dict(K _ Dr) then if K == F then true else {DictMember Dr F} end
      end
   end
   fun {DictAccess D F}
      case D
      of emptyDict then raise error('Key not found') end
      [] dict(K V Dr) then if K==F then V else {DictAccess Dr F} end
      end
   end
   fun {DictAdjoin D K V}
      case D
      of emptyDict then dict(K V {NewDict})
      [] dict(Kd Vd Dr) then
	 if Kd == K then dict(K V Dr)
	 else dict(Kd Vd {DictAdjoin Dr K V}) end
      end
   end
   fun {DictRemove D F}
      case D
      of emptyDict then raise error('Key not found') end
      [] dict(K V Dr) then
	 if K == F then Dr
	 else dict(K V {DictRemove Dr F}) end
      end
   end
   */

   % Implementazione con record
   fun {NewDict} dict end
   fun {DictMember D F} {HasFeature D F} end
   fun {DictAccess D F} D.F end
   fun {DictAdjoin D K V} {AdjoinAt D K V} end
   fun {DictRemove D F} {Record.subtract D F} end
  
   D1 D2 D3 D4 D5 E1 E2
in
   D1 = {NewDict}
   D2 = {DictAdjoin D1 hello world}
   D3 = {DictAdjoin D2 this_is a_try}
   E1 = {DictAccess D3 hello}
   {Browse D1}
   {Browse D2}
   {Browse D3}
   {Browse E1}
   try
      {Browse {DictMember D3 hello}}
      {Browse {DictMember D3 random}}
      D4 = {DictRemove D3 hello}
      {Browse D4}
      D5 = {DictRemove D4 this_is}
      {Browse D5}
      E2 = {DictAccess D4 hello}
      {Browse E2}
   catch error(X) then
      {Browse X}
   end
end
