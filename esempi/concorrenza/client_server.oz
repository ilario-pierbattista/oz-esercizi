% Il Server valuta delle espressioni matematiche inviate dai Client

local
   fun {NewAgent P}
      Port Stream
   in
      Port = {NewPort Stream}
      thread {ForAll Stream P} end
      Port
   end

   proc {Math E} Ans in
      case E 
      of add(N M Ans) then Ans = N + M
      [] mult(N M Ans) then Ans = N*M
      else Ans = error('Unexpected Op')
      end
   end

   Server A B
in
   Server = {NewAgent Math}
   thread
      {Send Server add(2 3 A)}
      {Browse A}
   end
   thread 
      {Send Server mult(4 5 B)}
      {Browse B}
   end
end
