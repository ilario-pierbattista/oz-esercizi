% Il produttore produce alternativamente due caratteri
% Usare il modello demand driven

local
   proc {Produce A B Stream}
      case Stream
      of nil then {Browse 'production ended'}
      [] X|Xr then
	 X = A
	 {Produce B A Xr}
      end
   end

   proc {Consume Limit Stream}
      if Limit > 0 then X Xr in
	 X|Xr = Stream
	 {Browse X}
	 {Consume Limit-1 Xr}
      else
	 Stream = nil
	 {Browse 'done consuming'}
      end
   end

   Stream
in
   thread {Produce atom1 atom2 Stream} end
   thread {Consume 20 Stream} end
end
