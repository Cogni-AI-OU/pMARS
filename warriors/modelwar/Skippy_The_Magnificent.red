;name SkippyStone
;author SkippyTheMagnificent
;strategy Stone bomber
        ORG start
bomb    DAT #0, #0
ptr     DAT #0, #2521
start   MOV bomb, @ptr
        ADD #2521, ptr
        JMP start
