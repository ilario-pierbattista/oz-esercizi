% La funzione Inorder riceve in input un albero e lo visita in ordine stampandone gli elementi a video.
% La visita in ordine analizza prima il sottoalbero sinistro, stampa la tupla
% Valore#Profondità riferita al nodo, quindi analizza il sottoalbero destro
% L'albero è costituito dai record tree(value: <val> left: <left_tree> right: <right_tree>)
% L'albero vuoto è nil

local
   proc {Inorder T}
      proc {Visit T D}
	 case T
	 of nil then skip
	 [] tree(value:V left:LT right:RT) then
	    {Visit LT D+1}
	    {Browse V#D}
	    {Visit RT D+1}
	 end
      end
   in
      {Visit T 0}
   end
   T
in
   T = tree(value:a
	    left:tree(value:b
		      left:nil
		      right:tree(value:c
				 left:nil
				 right:nil
				)
		     )
	    right:tree(value:d
		       left:nil
		       right:nil
		      )
	   )
   {Inorder T}
end
