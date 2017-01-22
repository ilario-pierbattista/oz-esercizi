% Il produttore produce alternando due atomi forniti in input
% Usare la modalità supply-driven

local
   proc {Produce A B Limit ?Output}
      {Delay 700}
      if Limit > 0 then
	 Output = A|{Produce B A Limit-1}
      else
	 Output = nil
      end
   end

   proc {Consume Stream}
      {Delay 500}
      case Stream
      of nil then {Browse 'end'}
      [] X|Xr then {Browse X} {Consume Xr}
      end
   end
   
   Stream
in
   thread {Produce atom1 atom2 20 Stream} end
   thread {Consume Stream} end
end
