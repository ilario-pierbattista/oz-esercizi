% Esempio di Instantiation
% L'instantiation è la capacità di ottenere procedure values come risultato dell'attivazione
% di funzioni e procedure

local
   fun {Incrementer Step}
      fun {$ Operand}
	 Operand + Step
      end
   end

   I
in
   {Browse Incrementer}
   I = {Incrementer 3}
   {Browse I}
   {Browse 4}
   {Browse {I 4}}
end