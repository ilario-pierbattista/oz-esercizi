% Costruire la funzione CensorWord che prende una stringa W e ritorna la stringa
% "<Censored>" se W è "fan", "skirt" o "Perl", oppure W altrimenti

local
   fun {CensorWord W}
      Censor = "<Censored>"
      BlackList = ["fan" "skirt" "Perl"]
   in
      if {Member W BlackList} then Censor
      else W end
   end
in
   {Browse {CensorWord "Hello Wordl"}}
   {Browse {CensorWord "fan"}}
   {Browse {CensorWord "skirt"}}
   {Browse {CensorWord "Perl"}}
end
