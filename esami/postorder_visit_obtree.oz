% Visita in postordine di un albero

local
   proc {POVisit T P}
      case T
      of leaf then skip
      [] tree(k:K v:V left:LT right:RT) then
	 {POVisit LT P}
	 {POVisit RT P}
	 {P K#V}
      end
   end

   T = tree(k:10
	    v:hello
	    left:tree(k:5
		      v:world
		      left:tree(k:2
				v:this
				left:leaf
				right:leaf)
		      right:tree(k:8
				 v:is
				 left:leaf
				 right:leaf))
	    right:tree(k:20
		       v:a
		       left:tree(k:15
				 v:binary
				 left:tree(k:12
					   v:ordered
					   left:leaf
					   right:leaf)
				 right:tree(k:18
					    v:tree
					    left:leaf
					    right:leaf))
		       right:tree(k:30
				  v:postorder
				  left:leaf
				  right:leaf))
	   )
in
   {Browse T}
   {POVisit T Browse}
end
