; Develop a program that will print out the nth element of the Fibonacci sequence.

include \masm32\include\masm32rt.inc

sum PROTO :dword, :dword
fibo PROTO :dword

.code
start:
    call main
    exit

main proc
    local n: dword
    local result: dword
    mov n, sval(input("Enter n: "))
    invoke fibo, n
    mov result, eax
    print chr$("Result: ")
    print str$(result)
    print chr$(13, 10)
    ret
main endp

fibo proc n: dword

    LOCAL t1: dword
    LOCAL t2: dword
    LOCAL tmp: dword
    LOCAL count: dword


    CMP n, 1
        je ONE
    CMP n, 2
        je ONE

    mov t1, 1
    mov t2, 1
    mov eax, n
    SUB eax, 1
    mov count, eax

    CONTD:
        CMP count, 0
            je STOP
        mov eax, t2
        mov tmp, eax
        invoke sum, t1, t2
        mov t2, eax
        mov eax, tmp
        mov t1, eax
        dec count
        jmp CONTD

    STOP:
        ret

    ONE:
        mov eax, 1
        ret
fibo endp

sum proc v1: dword, v2: dword
    mov eax, v1
    add eax, v2
    ret
sum endp

end start