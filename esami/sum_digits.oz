% Definire una funzione {SC N} che dato un numero N ne ricava la somma delle cifre

local
   fun {SC N}
      fun {SC2 N Acc} D M in
	 D = N mod 10
	 M = N div 10
	 if M == 0 then Acc+D
	 else {SC2 M (Acc+D)}
	 end
      end
   in
      {SC2 N 0}
   end
in
   {Browse {SC 965}}
end
