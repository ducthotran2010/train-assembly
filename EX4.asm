;Ex4: Write a MASM program that will solve the equation ax+b=0

include \masm32\include\masm32rt.inc 
.code 
start:
    call main
    exit 
    
main proc
    LOCAL a: DWORD
    LOCAL b: DWORD
    LOCAL res: DWORD
    LOCAL neg1:DWORD
    mov neg1, -1

    mov a, sval(input("Nhap a: "))
    mov b, sval(input("Nhap b: "))

    mov eax, a
    cmp eax, 0
    je a0
    jg aNot0
    jl aNot0

    a0:
        mov eax, b
        cmp eax, 0
        je b0
        jg bNot0
        jl bNot0

        b0:
            print chr$("Phuong trinh vo so nghiem!", 13, 10)
            ret
        bNot0:
            print chr$("Phuong trinh vo nghiem!", 13, 10)
            ret
    aNot0:
        mov eax, b
        cmp eax, 0
        je chiabth
        jg chiabth
        jl batthuong
        chiabth:
            mov eax, b
            mov edx, 0
            idiv a
            mul neg1
            mov res, eax
            jmp over
        batthuong:
            mov eax, b
            mul neg1
            mov edx, 0
            idiv a
            mov res, eax
            jmp over

    over:
        print "Ket qua: "
        print str$(res)
        ret
main endp

end start