% Modello demand-driven: il produttore fa il quadrato degli elementi in lista
% il consumatore calcola il minimo

local
   proc {Producer Xs Stream}
      case Stream
      of nil then {Browse 'done producing'}
      [] S|Sr then X Xr in
	 X|Xr = Xs
	 S = X*X
	 {Producer Xr Sr}
      end	 
   end

   proc {Consumer List Minimum Stream}
      case List
      of nil then Stream = nil {Browse 'done consuming. minimum:'#Minimum}
      [] X|Xr then S Sr in
	 S|Sr = Stream
	 if Minimum == inf then {Consumer Xr S Sr}
	 else {Consumer Xr {Min Minimum S} Sr} end
      end
   end

   Xs=[10 20 30 3 40 50 9 2 19 15] Stream
in
   thread {Producer Xs Stream} end
   thread {Consumer Xs inf Stream} end
end
