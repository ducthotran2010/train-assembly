; In the ASM program, the integer n will be accepted then value of n! will be printed out
; n! = 1* 2 * 3* …. * n

include \masm32\include\masm32rt.inc

factorial PROTO :dword

.code
start:
    call main
    exit

main proc
    local n: dword
    local result: dword
    mov n, sval(input("Enter n: "))
    invoke factorial, n
    mov result, eax
    print chr$("Result: ")
    print str$(result)
    print chr$(13, 10)
    ret
main endp

factorial proc n: dword
    local count: dword
    local n1: dword
    local tmp: dword

    mov count, 1
    mov eax, n
    inc eax
    mov n1, eax
    mov tmp, 1
    
    CONTD:
        mov ebx, n1
        mov eax, tmp
        CMP count, ebx
            je STOP
        imul eax, count
        mov tmp, eax
        inc count
        jmp CONTD

    STOP:
        ret
factorial endp

end start
