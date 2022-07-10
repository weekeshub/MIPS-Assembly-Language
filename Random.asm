## CS 254 Program 7
##
## Enter seed and how many random ints are desired.
##
## Programmer: Andrew Weekes
## Date: 3/29/22
##
## Register use table:
## $t0 user's intial value
## $t1 loop iterator
## $t2 current random value
## $s0 how many numbers to generate
## $s1 a = 21
## $s2 b = 53
## $s3 100


        .text
        .globl main

main:

        li     $s1,21             # load a 21 into $s1 (a)
        li     $s2,53             # load a 53 into $s2 (b)
        li     $s3,100            # load a 100 into $s3

        li     $v0,4              # load a 4 into $v0 to print string
        la     $a0,initial        # load address of prompt from data
        syscall

        li     $v0,5              # load a 5 into $v0 to read an integer
        syscall                   # store user input into $v0
        move   $t0,$v0            # move integer from $v0 into $t0

        li     $v0,4              # load a 4 into $v0 to print string
        la     $a0,howMany        # load address of prompt from data
        syscall

        li     $v0,5              # load a 5 into $v0 to read an integer
        syscall                   # store user input into $v0
        move   $s0,$v0            # move integer from $v0 into $s0

loop:

        beq    $t1,$s0,breakLoop  # while iterator is not equal to howMany
        mult   $t0,$s1            # multiply initial value by 21 
        mflo   $t2                # store in $t2
        add    $t2,$t2,$s2        # add 53 to $t2
        divu   $t2,$s3            # divide $t2 by 100
        mfhi   $t2                # store remainder into $t2
        li     $v0,1              # load a 1 into $v0 to print an integer
        move   $a0,$t2            # copy contents of $t2 into $a0
        syscall                   # print out contents of $t2 with syscall
        li     $v0,4              # load a 4 into $v0 to print string
        la     $a0,newLine        # load address of prompt from data
        syscall                   # print out new line character
        move   $t0,$t2            # move current random value into initial value register ($t0)
        addi   $t1,$t1,1          # increment loop iterator by 1
        j      loop               # jump back to loop


breakLoop:

        li     $v0,4              # load a 4 into $v0 to print string
        la     $a0,done           # load address of prompt from data
        syscall                   # print out done
        
        li     $v0,10             # load a 10 into $v0 to exit the program with syscall
        syscall


          .data

initial:  .asciiz       "Enter an initial value: "
howMany:  .asciiz       "Enter how many numbers to print: "
newLine:  .asciiz       "\n"
done:     .asciiz       "Done."


## End of file