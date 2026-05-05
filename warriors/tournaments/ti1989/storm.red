; STORM by  Paolo Montrasio
; this was my entry at the 2nd Core War Italian Tournament 1989
; if you know the italian language you are lucky : read the remarks !
; if you don't know it... guess what this programs does !
; hint. look at these warriors : madness and assault.


ptr      dat #8              ; puntatore per il bombardamento
start    mov #8,ptr          ; inizializzazione del puntatore
         mov #1,poison       ; e della bomba
loop     add #5003,ptr       ; si incrementa il puntatore e si
         sub #5003,poison    ; decrementa la bomba : sincronizzazione !
         mov poison,@ptr     ; si piazza la bomba
ct       djn loop,#988       ; ci si arresta prima di colpirsi
         jmp phase2          ; e ci si copia più in là
poison   jmp @0              ; ecco la bomba alla cowboy
entrance sub #1,slaves       ; ogni processo catturato decrementa un
prison   spl entrance        ; contatore e cerca di generare altri 
         jmn prison,slaves   ; prigionieri. Se sono 64 si suicidano
slaves   dat #64             ; contatore per i prigionieri
init     add #11,to          ; processo ausiliario per la reinizializ-
         mov new,@to         ; zazione del contatore dopo la copia
new      dat #64             ; allo scopo si usa questa dat
unused   jmp entrance        ; qui cadrà una bomba ...
phase2   mov #988,ct         ; reinizializzazione conto alla rovescia
         mov #24,ptr         ; 24 è la lunghezza di STORM
         mov #4743,to        ; ci si copia 4743 locazioni oltre
copy     mov @ptr,<to        ; il classico ciclo di copia...
         djn copy,ptr        ; ...
         spl @to             ; si lancia la nuova copia
to       jmp init            ; e si avvia il processo ausiliario
                             ; l'ordine delle due istruzioni è critico
                             ; gli eventuale processi prigionieri sono
                             ; recuperati in breve da una bomba
           end     start
