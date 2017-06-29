;Ex3: Write a program that will accept 3 numbers, then sum of them and their average will be printed out.

include \masm32\include\masm32rt.inc 
.data
    CONST_3 dd 3
    CONST_neg1 dd -1
.code 
start:
    call main
    exit 
    
main proc
    LOCAL int1: DWORD
    LOCAL int2: DWORD
    LOCAL int3: DWORD
    mov int1, sval(input("Nhap so thu 1: "))
    mov int2, sval(input("Nhap so thu 2: "))
    mov int3, sval(input("Nhap so thu 3: "))

    mov eax, int1
    add eax, int2
    add eax, int3
    mov int1, eax

    mov eax, int1
    cmp eax, 0
    je bth
    jg bth
    jl kth

    bth:
        mov edx, 0
        div CONST_3
        mov int1, eax
        jmp over

    kth:
        imul CONST_neg1
        mov edx, 0
        idiv CONST_3
        imul CONST_neg1
        mov int1, eax
        jmp over

    over:
    print "Ket qua: " 
    print str$(int1)
    ret
main endp

end start