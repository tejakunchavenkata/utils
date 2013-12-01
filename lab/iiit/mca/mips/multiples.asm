# multiples.asm
#       Takes two numbers from user as input and prints
# all the multiples of first number < second number

.text
main:
        # Read first number
        li $v0, 5
        syscall
        move $t0, $v0
        blez $t0, E_A_LE_0

        # Read second number
        li $v0, 5
        syscall
        move $t1, $v0
        ble $t1, $t0, E_B_LE_A

        # Initialize $t2
        move $t2, $t0

loop:
        move $a0, $t2
        li $v0, 1
        syscall
        la $a0, space
        li $v0, 4
        syscall

        addu $t2, $t2, $t0
        # Return / exit program
        bgt $t2, $t1 exit
        j loop

E_A_LE_0:
        # Print Error Message
        la $a0, MSG_A_LE_0
        li $v0, 4
        syscall
        j exit
        
E_B_LE_A:
        # Print Error Message
        la $a0, MSG_B_LE_A
        li $v0, 4
        syscall
        j exit

exit:
        la $a0, MSG_EXIT
        li $v0, 4
        syscall
        li $v0, 10
        syscall

.data
MSG_A_LE_0:     .asciiz "First number must be non zero positive integer\n"
MSG_B_LE_A:     .asciiz "Second munber must be greater than First number\n"
MSG_EXIT:       .asciiz "\nProgram Finished\n"
space:          .asciiz " "
