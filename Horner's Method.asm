## CS 254 Program 3
##
## Compute 5x^4 - 2x^3 + 12x^2 - 3x + 10 using Horner's Method
##
## Programmer: Andrew Weekes
## Date: 2/26/22

## Register Use:
##  $16   x
##  $23   accumulator, result of expression

        .text
        .globl  main

main:

        addiu    $16,$16,1      ##start Horner's method by loading the value of "x" into $16
        addiu    $23,$0,5       ##start accumulating in $23 by loading the coefficient value of the highest degree term
        multu    $23,$16        ##multiply coefficient value of highest degree term by value of "x"
        mfhi     $23            ##store results of multiplication instruction in accumulator
        mflo     $23            ##store results of multiplication instruction in accumulator
        addiu    $23,$23,-2     ##add coefficient value of the second highest degree term
        multu    $23,$16        ##multiply entire current expression by "x"
        mfhi     $23            ##store results of multiplication instruction in accumulator
        mflo     $23            ##store results of multiplication instruction in accumulator
        addiu    $23,$23,12     ##add coefficient value of next highest degree term
        multu    $23,$16        ##multiply entire current expression by "x"
        mfhi     $23            ##store results of multiplication instruction in accumulator
        mflo     $23            ##store results of multiplication instruction in accumulator
        addiu    $23,$23,-3     ##add coefficient value of next highest degree term
        multu    $23,$16        ##multiply entire current expression by "x"
        mfhi     $23            ##store results of multiplication instruction in accumulator
        mflo     $23            ##store results of multiplication instruction in accumulator
        addiu    $23,$23,10     ##finally, add coefficient value of lowest degree term

## End of file