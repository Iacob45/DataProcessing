section .data
text1 db "Se citeste scala: ",0
len_text1 equ $-text1
text2 db "Se citeste sirul: ",0
len_text2 equ $-text2
text3 db "Cifre: ",0
len_text3 equ $-text3
text4 db 10,"Vocale: ",0
len_text4 equ $-text4
text5 db 10,"Altele: ",0
len_text5 equ $-text5
NewLine db 10

section .bss
x resb 1
sir resb 100
vocale resb 3
cifre resb 3
altele resb 3
v resb 1
c resb 1
a resb 1
o resb 1


section .text
global _start

_start:

mov [o], byte 'o'

mov ebx,1
mov eax,4
mov ecx,text1
mov edx,len_text1
int 0x80

mov eax, 3
mov ebx, 2
mov ecx, x
mov edx, 1
int 0x80

mov ebx,1
mov eax,4
mov ecx,text2
mov edx,len_text2
int 0x80

mov eax, 3
mov ebx, 0
mov ecx, sir
mov edx, 100
int 0x80
mov eax, 3
mov ebx, 0
mov ecx, sir
mov edx, 100
int 0x80




mov esi, sir
mov [vocale],byte 0
mov [cifre],byte 0
mov [altele],byte 0

_parcurgere:
cmp [esi],byte 0
je _done
cmp [esi],byte 'a'
je _vocala
cmp [esi],byte 'e'
je _vocala
cmp [esi],byte 'i'
je _vocala
cmp [esi],byte 'o'
je _vocala
cmp [esi],byte 'u'
je _vocala
cmp [esi],byte 'A'
je _vocala
cmp [esi],byte 'E'
je _vocala
cmp [esi],byte 'I'
je _vocala
cmp [esi],byte 'O'
je _vocala
cmp [esi],byte 'U'
je _vocala
cmp [esi],byte '0'
jb _altele
cmp [esi],byte '9'
ja _altele


inc byte [cifre]
inc esi
jmp _parcurgere


_vocala:
inc byte [vocale]
inc esi
jmp _parcurgere

_altele:
inc byte [altele]
inc esi
jmp _parcurgere


_done:
sub [altele],byte 1 ;scad newline

sub [x],byte '0'

mov eax, 0
mov ecx, 0
mov al,[cifre]
mov cl, [x]
div cl
mov [c], al

mov eax, 0
mov ecx, 0
mov al,[vocale]
mov cl, [x]
div cl
mov [v], al

mov eax, 0
mov ecx, 0
mov al,[altele]
mov cl, [x]
div cl
mov [a], al






mov eax, 0
mov ecx, 0
mov al, [cifre]
mov cl, 100
div cl
mov [cifre], al
cmp al, 0
je nu1
add [cifre],byte '0'
nu1:
mov al, ah
mov ah,0
mov cl, 10
div cl
mov [cifre+1],al
cmp al, 0
je nu2
add [cifre+1],byte '0'
nu2:
mov [cifre+2], ah
add [cifre+2], byte '0'

mov eax, 0
mov ecx, 0
mov al, [vocale]
mov cl, 100
div cl
mov [vocale], al
cmp al, 0
je nu3
add [vocale],byte '0'
nu3:
mov al, ah
mov ah,0
mov cl, 10
div cl
mov [vocale+1],al
cmp al, 0
je nu4
add [vocale+1],byte '0'
nu4:
mov [vocale+2], ah
add [vocale+2], byte '0'

mov eax, 0
mov ecx, 0
mov al, [altele]
mov cl, 100
div cl
mov [altele], al
cmp al, 0
je nu5
add [altele],byte '0'
nu5:
mov al, ah
mov ah,0
mov cl, 10
div cl
mov [altele+1],al
cmp al, 0
je nu6
add [altele+1],byte '0'
nu6:
mov [altele+2], ah
add [altele+2], byte '0'









mov ebx,1
mov eax,4
mov ecx,text3
mov edx,len_text3
int 0x80
mov ebx,1
mov eax,4
mov ecx,cifre
mov edx,3
int 0x80

mov ebx,1
mov eax,4
mov ecx,text4
mov edx,len_text4
int 0x80
mov ebx,1
mov eax,4
mov ecx,vocale
mov edx,3
int 0x80

mov ebx,1
mov eax,4
mov ecx,text5
mov edx,len_text5
int 0x80
mov ebx,1
mov eax,4
mov ecx,altele
mov edx,3
int 0x80


mov ebx,1
mov eax,4
mov ecx,NewLine
mov edx,1
int 0x80


mov ebx,1
mov eax,4
mov ecx,text3
mov edx,len_text3
int 0x80

_co:
cmp [c],byte 0
je _coo

mov ebx,1
mov eax,4
mov ecx,o
mov edx,1
int 0x80

dec byte [c]
jmp _co
_coo:


mov ebx,1
mov eax,4
mov ecx,text4
mov edx,len_text4
int 0x80

_vo:
cmp [v],byte 0
je _voo

mov ebx,1
mov eax,4
mov ecx,o
mov edx,1
int 0x80

dec byte [v]
jmp _vo
_voo:


mov ebx,1
mov eax,4
mov ecx,text5
mov edx,len_text5
int 0x80

_ao:
cmp [a],byte 0
je _aoo

mov ebx,1
mov eax,4
mov ecx,o
mov edx,1
int 0x80

dec byte [a]
jmp _ao
_aoo:


mov	eax,1		    ; system call number (sys_exit)
mov ebx,0           ; exit code
int	0x80		    ; call kernel
