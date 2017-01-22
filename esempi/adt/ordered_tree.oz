% Implementazione degli alberi binari ordinati
% Definizione ricorsiva di albero binario:
% <Tree V> ::= leaf | tree(key: <Integer> val: <V> left: <Tree V> right: <Tree V>)
%
% Domini: Interi, <Value>, Insieme di tutti gli alberi a valori in <Value>
% Operazioni:
% - Insert :: (Integer) (V) (<Tree V>) -> (<Tree V>)
% - Search :: (Integer) (<Tree V>) -> found(V)|notfound
% - Remove :: (Integer) (<Tree V>) -> (<Tree V>)
% - Flatter :: (<Tree V>) -> (<List V>) 
% Concetti primitivi: leaf

local
   fun {NewTree} leaf end

   fun {Insert K V T}
      case T
      of leaf then tree(key:K val:V left:leaf right:leaf)
      [] tree(key:Kt val:Vt left:LT right:RT) then
	 if Kt == K then tree(key:Kt val:V left:LT right:RT)
	 elseif K < Kt then tree(key:Kt val:Vt left:{Insert K V LT} right:RT)
	 elseif K > Kt then tree(key:Kt val:Vt left:LT right:{Insert K V RT})
	 end
      end
   end

   fun {Search K T}
      case T
      of leaf then notfound
      [] tree(key:Kt val:Vt left:_ right:_) andthen Kt == K then found(Vt)
      [] tree(key:Kt val:_ left:LT right:_) andthen K < Kt then {Search K LT}
      [] tree(key:Kt val:_ left:_ right:RT) andthen K > Kt then {Search K RT}
      end
   end

   fun {Remove K T}
      % Casi:
      % 1) cancellazione di un nodo che non ha sottoalbero destro -> il sottoalbero sinistro
      % prende il suo posto
      % 2) cancellazione di un nodo con sottoalbero destro -> il nodo più a sinistra del sottoalbero
      % destro prende il suo posto
      fun {RemoveLeftMostFromTree T}
	 case T
	 of tree(key:K val:V left:leaf right:leaf) then T#leaf
	 [] tree(key:K val:V left:leaf right:RT) then
	    tree(key:K val:V left:leaf right:leaf)#RT
	 [] tree(key:K val:V left:LT right:RT) then E NT in
	    E#NT = {RemoveLeftMostFromTree LT}
	    E#tree(key:K val:V left:NT right:RT)
	 end   
      end
   in
      case T
      of leaf then leaf
      [] tree(key:Kt val:_ left:LT right:RT) andthen Kt == K then
	 if RT == leaf then LT
	 else Kn Vn NewRightTree in
	    tree(key:Kn val:Vn left:leaf right:leaf)#NewRightTree = {RemoveLeftMostFromTree RT}
	    tree(key:Kn val:Vn left:LT right:NewRightTree)
	 end
      [] tree(key:Kt val:Vt left:LT right:RT) andthen K < Kt then tree(key:Kt val:Vt left:{Remove K LT} right:RT)
      [] tree(key:Kt val:Vt left:LT right:RT) andthen K > Kt then tree(key:Kt val:Vt left:LT right:{Remove K RT})
      end
   end

   fun {Flatter T}
      case T
      of leaf then nil
      [] tree(key:K val:V left:LT right:RT) then
	 {Append {Flatter LT} K#V|{Flatter RT}}
      end
   end

   T1 T2 T3 T4 T5 T6 
in
   T1 = {NewTree}
   {Browse T1}
   T2 = {Insert 3 hello T1}
   {Browse T2}
   T3 = {Insert 4 world T2}
   {Browse T3}
   T4 = {Insert 10 tree T3}
   {Browse T4}
   T5 = {Insert 1 under T4}
   {Browse T5}
   T6 = {Insert 2 construction T5}
   {Browse T6}
   {Browse {Search 2 T6}}
   {Browse {Search 8 T6}}
   {Browse {Remove 3 T6}}
   {Browse {Flatter T6}}
end
