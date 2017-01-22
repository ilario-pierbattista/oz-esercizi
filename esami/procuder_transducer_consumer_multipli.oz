% Realizzare una pipeline Produttore-Trasduttore-Consumatore in modalità supply-driven
% Il produttore produce i primi N multipli di un dato numero K
% Il trasduttore scarta i numeri dispari
% Il consumatore stampa a video

local
   proc {Producer N K Stream}
      proc {P N K Current Stream} X Xr in
	 if Current == N then Stream = nil {Browse 'done producing'}
	 else
	    X|Xr = Stream
	    X = (Current + 1)*K
	    {P N K Current+1 Xr}
	 end
      end
   in
      {Delay 400}
      {P N K 0 Stream}
   end

   proc {Transducer Input Output} X Xr in
      {Delay 200}
      case Input
      of nil then Output = nil
      [] I|Ir then
	 if I mod 2 == 0 then
	    X|Xr = Output
	    X = I
	 else
	    Xr = Output
	 end
	 {Transducer Ir Xr}
      end
   end

   proc {Consumer Stream}
      {Delay 500}
      case Stream
      of nil then {Browse 'done consuming'}
      [] X|Xr then {Browse X} {Consumer Xr}
      end
   end

   PT TC
in
   thread {Producer 10 3 PT} end
   thread {Transducer PT TC} end
   thread {Consumer TC} end
end
