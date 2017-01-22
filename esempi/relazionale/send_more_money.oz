% Risoluzione del problema SEND MORE MONEY con la programmazione vincolata
%  SEND +
%  MORE =
% -------
% MONEY
% Associare una cifra ad ogni lettera (che ha un valore diverso dalle altre)

local
   fun {SMM}
      S E N D M O R Y Sol
   in
      Sol = sol(s:S e:E n:N d:D m:M o:O r:R y:Y)
      % -- Basic constraints --
      Sol::0#9   % Inizializzazione compatta di tutti i campi del record
      {FD.distinct S} % Ogni lettera ha un valore diverso dalle altre
      S \=: 0
      M \=: 0 % Il valore in testa non può essere nullo

      % -- Propagatos --
      (1000*S + 100*E + 10*N + D) + (1000*M + 100*O + 10*R + E) =: 10000*M + 1000*O + 100*N + 10*E + Y

      {FD.distibute ff Sol}
      Sol
   end
in
   {ExploreAll SMM}
   % {Browse {Search.base.one SMM}}
end
