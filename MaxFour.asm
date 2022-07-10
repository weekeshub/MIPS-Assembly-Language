## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer: Andrew Weekes
## Date: 5/3/22
##
## Register use table:
##
## $s1   first integer
## $s2   second integer
## $s3   third integer
## $s4   fourth integer

        .text
        .globl main

main:

        jal     pread            # read first integer
        nop                      #
        move    $s1,$v0          # save it in $s1

        jal     pread            # read second integer
        nop                      #
        move    $s2,$v0          # save it in $s2

        jal     pread            # read third integer
        nop                      #
        move    $s3,$v0          # save it in $s3

        jal     pread            # read third integer
        nop                      #
        move    $s4,$v0          # save it in $s4


        bgtu    $s1,$s2,first    # is first bigger than second?
        bgtu    $s2,$s3,second   # is second bigger than third?
        bgtu    $s3,$s4,third    # is third bigger than fourth?
        j       fourth           # if it gets to this step, fourth is max

first:
                                 # first is bigger than second,
                                 # but is it bigger than third or fourth?

        bgtu    $s3,$s1,third    # third is bigger than first
        bgtu    $s4,$s1,fourth   # fourth is bigger than first

                                 # if it gets to this step, first integer is maximum
        li      $v0,4            # load a 4 to print string
        la      $a0,prompt       # prompt for maximum integer
        syscall

        move    $a0,$s1          # argument to print integer maximum
        li      $v0,1            # print integer
        syscall

        li      $v0,4            # load a 4 to print string
        la      $a0,done         # done
        syscall

        li      $v0,10           # exit program
        syscall

second:

        bgtu    $s3,$s2,third    # third is bigger than second
        bgtu    $s4,$s2,fourth   # fourth is bigger than second

                                 # if it gets to this step, second integer is maximum
        li      $v0,4            # load a 4 to print string
        la      $a0,prompt       # prompt for maximum integer
        syscall
        
        move    $a0,$s2          # argument to print integer maximum
        li      $v0,1            # print integer
        syscall

        li      $v0,4            # load a 4 to print string
        la      $a0,done         # done
        syscall

        li      $v0,10           # exit program
        syscall

third:

        bgtu    $s4,$s3,fourth   # fourth is bigger than third

                                 # if it gets to this step, third integer is maximum
        li      $v0,4            # load a 4 to print string
        la      $a0,prompt       # prompt for maximum integer
        syscall

        move    $a0,$s3          # argument to print integer maximum
        li      $v0,1            # print integer
        syscall

        li      $v0,4            # load a 4 to print string
        la      $a0,done         # done
        syscall

        li      $v0,10           # exit program
        syscall

fourth:

                                 # if it gets to this step, fourth integer is maximum
        move    $a0,$s4
        li      $v0,4            # load a 4 to print string
        la      $a0,prompt       # prompt for integer maximum
        syscall                  

        move    $a0,$s4          # argument to print integer maximum
        li      $v0,1            # print integer
        syscall

        li      $v0,4            # load a 4 to print string
        la      $a0,done         # done
        syscall

        li      $v0,10           # exit program
        syscall

            .data
prompt:     .asciiz     "The largest integer is: "
done:       .asciiz     "\nDone.\n"