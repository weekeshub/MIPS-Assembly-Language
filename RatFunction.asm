## CS 254 Program 5
##
## Evaluate (8x^2-3x+12) / (3x^2+2x-16) 
##
## Programmer: Andrew Weekes
## Date: 3/11/22
##
## Register Use:
## $10   base address
## $11   x
## $13   value of first term of first expression
## $14   value of second term of first expression
## $15   value of last term of first expression
## $16   value of first expression
## $17   value of first term in second expression
## $18   value of second term in second expression
## $19   value of last term in second expression
## $20   value of second expression
## $21   quotient of divu instruction
## $22   remainder of divu instruction
## $25   value assigned to error

        .text
        .globl  main

main: 
        lui    $10,0x1000      #  Init base register
        ori    $10,$10,0x0000  #  Complete lower half of base address
        lw     $11,0($10)      #  Load x


        ori    $13,$0,8        #  Load first term (8) in the first group
                               #  during load delay

        multu  $13,$11         #  Multiply 8 by x to get 8x
        mfhi   $13             #  Store result in $13
        mflo   $13

        multu  $13,$11         #  Multiply 8x by x to get 8x^2
        mfhi   $13             #  Store result in $13
        mflo   $13

        addiu  $14,$14,-3      #  Load second term (-3) in the first group
        mult   $14,$11         #  Multiply -3 by x to get -3x
        mfhi   $14             #  Store result in $14
        mflo   $14

        ori    $15,$0,12       #  Load last term in the first group

        add    $16,$13,$14     #  Add first and second terms, store result in $16
        add    $16,$16,$15     #  Add the result of that to the last term, 
                               #  store result in $16

        ori    $17,$0,3        #  Load first term (3) in the second group

        multu  $17,$11         #  Multiply 3 by x to get 3x
        mfhi   $17             #  Store result in $17
        mflo   $17

        multu  $17,$11         #  Multiply 3x by x to get 3x^2
        mfhi   $17             #  Store result in 3x^2
        mflo   $17		

        addiu  $18,$18,2       #  Load second term (2) in the second group
        mult   $18,$11         #  Multiply 2 by x to get 2x
        mfhi   $18             #  Store result in $18
        mflo   $18

        addiu  $19,$19,-16     #  Load last term in the second group

        add    $20,$17,$18     #  Add first and second terms, store result in $20
        add    $20,$20,$19     #  Add the result of that to the last term,
                               #  store result in $20

        ori    $25,$0,0        #  Holds the value of 0 for error

        beq    $20,$0,equal    #  Determine if denominator is equal to 0
        sll    $0,$0,0         #  No-op instruction

unequal:
        sw     $25,0x0C($10)   #  Store value of 0 for error
        divu   $16,$20         #  Divide first expression by second expression
        mflo   $21             #  Move quotient into $21
        mfhi   $22             #  Move remainder into $22
        sw     $21,0x04($10)   #  Store quotient in ratio
        sw     $22,0x08($10)   #  Store remainder in remainder
        j      finish          #  Jump instruction to end of program
        sll    $0,$0,0         #  No-op instruction

equal:
        addiu  $25,$25,1       #  Add value of 1 to $25
        sw     $25,0x0C($10)   #  Store value of 1 to error
        j      finish          #  Jump instruction to end of program
        sll    $0,$0,0         #  No-op instruction

finish:


            .data
x:          .word   1          #  Edit this line to change the value of x
ratio:      .word   0          #  Holds the value of the quotient
remainder:  .word   0          #  Holds the value of the remainder
error:      .word   0          #  Holds value to determine whether or not denominator is equal to 0

## End of file