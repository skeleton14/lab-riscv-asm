.data
M:
.word 5
N:
.word 3
matrix:
.word 1, 2, 3, 4 ,5
.word 3, 1, 2, 4, 5
.word -5, 4, -3, 2, -1

.text
#Карта регистров
#a0 - массив
#a1 - M, кол-во элементов в строке
#a2 - N, кол-во строк
#t0 - сумма
#t1 - наименьшая строка
#t2 - наименьшая сумма
#t3 - счетчик элементов в строке
#t4 - текущий элемент массива
#t5 - счетчик строк
main:
la a0, matrix
la t0, M
lw a1, 0(t0)
la t0, N
lw a2, 0(t0)
li a2, 3
call find_lesser
mv a1, a0
li a0, 1
ecall
li a0, 10
ecall

find_lesser:
li t2, 0x7FFFFFFF
li t1, 0
li t3, 0
li t4, 0
li t5, 0
j rows_loop

rows_loop:
bge t5, a2, result
li t0, 0
li t3, 0
j cols_loop

cols_loop:
bge t3, a1, done
lw t4, 0(a0)
add t0, t0, t4
addi a0, a0, 4
addi t3, t3, 1
j cols_loop

done:
bge t0, t2, skip
mv t2, t0
mv t1, t5

skip:
addi t5, t5, 1
j rows_loop

result:
addi t1, t1, 1
mv a0, t1
ret