## CS 254 Program 8
##
## Determine if user-entered number is a perfect number.
##
## Programmer: Andrew Weekes
## Date: 4/16/22
##
## Register use table:
##
## $s0      N
## $s1      sum
## $s2      divisor
## $s3      quotient
## $s4      remainder
## $s5      1
## $s6      0


        .text
        .globl main
        
main:

        li     $s1,0                # initialize a sum to 0
        li     $s5,1                # compare divisor to 1
        lw     $s2,divisor          # load intial value of divisor (1)
        lw     $s3,quotient         # load initial value of quotient (0)

        li     $v0,4                # load a 4 to print string
        la     $a0,prompt           # prompt user to enter a number
        syscall
        
        li     $v0,5                # load a 5 into $v0 to read an integer
        syscall                     # store user input into $v0
        move   $s0,$v0              # move integer from $v0 into $s1
        
loop:
      
        beq    $s0,$s2,end          # while divisor <= num
        remu   $s4,$s0,$s2          # calculate remainder of num / divisor
        bne    $s6,$s4,skip         # if remainder is not 0, skip calculation
        bne    $s5,$s2,calculate    # if divisor is not equal to 1, calculate
        
add1:

        addu   $s1,$s1,$s5          # add one to sum
        addu   $s2,$s2,1            # increment divisor
        b      loop
        
calculate:

        divu   $s3,$s0,$s2          # quotient of num / divisor
        addu   $s2,$s2,1            # increment divisor
        addu   $s1,$s1,$s3          # sum += quotient
        b      loop                 # jump back to beginning of loop
        
skip:

        addu   $s2,$s2,1            # increment divisor
        b      loop                 # jump back to beginning of loop
       
end:

        beq    $s0,$s1,perfect      # if sum == num, perfect
        bne    $s0,$s1,notperfect   # if sum != num, notperfect
        
perfect:

        li     $v0,4                # load a 4 to print string
        la     $a0,prompt2          # print "perfect" message
        syscall
        b      finish               # done with program
        
notperfect:

        li     $v0,4                # load a 4 to print string
        la     $a0,prompt3          # print "not perfect" message
        syscall
        b      finish               # done with program
        
finish:
        
         
        

            .data
prompt:     .asciiz  "Enter a number: "
prompt2:    .asciiz  "That number is perfect!"
prompt3:    .asciiz  "That number is NOT perfect."
N:          .word    6          # number to test if perfect
divisor:    .word    1          # divide N by this to start
quotient:   .word    0          # add together to see if equal to N
