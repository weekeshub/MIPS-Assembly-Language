## CS 254 Program 4
##
## Evaluate (13x - 4xy + 18) / 7 
##
## Programmer: Andrew Weekes
## Date: 3/5/22
##
## Register Use:
##  $10   base register, address of x
##  $11   x
##  $12   address of y, y
##  $13   13*x
##  $14   -4*x*y
##  $15   18
##  $16   13x - 4xy + 18
##  $17   7
##  $18   quotient (answer) of (13x - 4xy + 18) / 7
##  $19   remainder of (13x - 4xy + 18) / 7

        .text
        .globl  main

main: 
        lui    $10,0x1000      #  Init base register for x
        ori    $10,$10,0x0000  #  Complete lower half of base address
        lw     $11,0($10)      #  Load x
        
        ori    $13,$0,13       #  Load first term in the expression
                               #  during load delay

        lw     $12,0x04($10)   #  Load y
        
        multu  $13,$11         #  Multiply first term by x to get 13x
        mfhi   $13             #  Store result in $13
        mflo   $13
        
        addiu  $14,$14,-4      #  Load second term in the expression
        mult   $14,$11         #  Multiply second by x to get -4x
        mfhi   $14             #  Store result in $14
        mflo   $14
        mult   $14,$12         #  Multiply -4x by y to get -4xy
        mfhi   $14             #  Store result in $14
        mflo   $14
        
        ori    $15,$0,18       #  Load last term in the expression
        
        add    $16,$13,$14     #  Add first and second terms, store result in $16
        add    $16,$16,$15     #  Add the result of that to the last term, 
                               #  store result in $16

        ori    $17,$0,7        #  Load value of number to be divided by
        
        divu   $16,$17         #  Divide $16 by 7 (number to be divided by)
        mflo   $18             #  Store quotient in $18
        mfhi   $19             #  Store remainder in $19

        sw     $18,0x08($10)   #  Store quotient ($18) at offset 0x08 in main memory
        sw     $19,0x0C($10)   #  Store remainder ($19) at offset 0x0C in main memory

        .data
x:          .word   1          #  Edit this line to change the value of x
y:          .word   1          #  Edit this line to change the value of y
answer:     .word   0          #  Holds the value of the quotient
remainder:  .word   0          #  Holds the value of the remainder

## End of file