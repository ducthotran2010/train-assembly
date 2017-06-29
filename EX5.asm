;Ex5: Write a MASM program that will accept 2 numbers, v1, v2 then print out v1+v2, v1-v2, v1*v2, v1/v2.
;Attention: The case in which v2=0 must be managed.

include \masm32\include\masm32rt.inc 
.data
    CONST_neg1 dd -1
    CONG dd 0
    TRU dd 0
    NHAN dd 1
    CHIA dd 1
.code 
start:
    call main
    exit 
    
main proc
    LOCAL v1: DWORD
    LOCAL v2: DWORD

    mov v1, sval(input("Nhap v1: "))
    mov v2, sval(input("Nhap v2: "))

    ;
    mov eax, v1
    add eax, v2
    mov CONG, eax
    print chr$(13, 10, "v1 + v2 = ")
    print str$(CONG)

    ;
    mov eax, v2
    imul CONST_neg1
    add eax, v1
    mov TRU, eax
    print chr$(13, 10, "v1 - v2 = ")
    print str$(TRU)

    ;
    mov eax, v1
    imul v2
    mov NHAN, eax
    print chr$(13, 10, "v1 * v2 = ")
    print str$(NHAN)

    ;
    mov eax, v2
    cmp eax, 0
    je v2bang0
    jg v2khac0
    jl v2khac0

    v2bang0: 
        print chr$(13, 10, "v1 / v2 vo nghiem!")
        ret
    v2khac0:
        mov eax, v1
        cmp eax, 0
        je bth
        jg bth
        jl kth

        bth:
            mov eax, v1
            mov edx, 0
            idiv v2
            mov CHIA, eax
            jmp over
        kth: 
            mov eax, v1
            mov edx, 0
            imul CONST_neg1
            idiv v2
            imul CONST_neg1
            mov CHIA, eax
            jmp over
        
    over:
        print chr$(13, 10, "v1 / v2 = ")
        print str$(CHIA)
        ret
main endp

end start