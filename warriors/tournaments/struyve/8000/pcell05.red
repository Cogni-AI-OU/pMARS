   ;redcode
   ;name Perfect Cell 0.5
   ;author K.Struyve <koen.struyve@rug.ac.be>
   ;assert CORESIZE == 8000


   dest0   equ     2200
   dest1   equ     3740
   dest2   equ     -1278

   paper
           spl     1,      <300
           mov     -1,     0
           mov     -1,     0
           spl     1,      <1200

   silk    spl     @0,     {dest0
           mov.i   }-1,    >-1
   silk1   spl     @0,     <dest1
           mov.i   }-1,    >-1
           mov     bomb,   {4500
           mov     <-5350, <5350
           mov     <-1970, <1970
           mov     {silk1, <silk2
   silk2   jmp     @0,     >dest2
   bomb    dat     <2667,  <5334
   end     paper
