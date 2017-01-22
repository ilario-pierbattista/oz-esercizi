% Client Server con Port
% Il Client manda al server numeri da N a 1
% Il server verifica la loro divisibilità per K (K inviato dal client)
% Il client controlla la divisibilità e stampa il numero in caso di successo

local
   fun {NewAgent P}
      Port Stream
   in
      Port = {NewPort Stream}
      thread {ForAll Stream P} end
      Port
   end

   proc {Elaborator Message}
      case Message
      of divisible(N K Result) then if N mod K == 0 then Result = true else Result = false end
      end
   end
   
   proc {Client N K Server} Result in
      if N > 0 then
	 {Send Server divisible(N K Result)}
	 if Result == true then {Browse N} end
	 {Client N-1 K Server}
      end
   end

   Server 
in
   {Browse 'begin'}
   thread Server = {NewAgent Elaborator} end
   {Client 30 3 Server}
end
