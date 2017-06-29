;Write a MASM program that will print the following cantor of Han Mac Tu

.486 
.model flat, stdcall   
option casemap :none                
include \masm32\include\windows.inc
include \masm32\macros\macros.asm  
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib

.code 
start:
    print chr$("Tuoc huu ngu si cu ky liet", 13, 10)
    print chr$("Dan huu tu si vi chi tien", 13, 10)
    print chr$("Co giang son thi si da co ten", 13, 10)
    print chr$("Tu chu han vo si nay la quy", 13, 10)
    exit
end start