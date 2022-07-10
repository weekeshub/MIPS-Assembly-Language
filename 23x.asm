## CS 254 Program 2
##
## Compute 23*x
##
## Programmer: Andrew Weekes
## Date: 2/20/2022
##
## Register Use:
##  $7   x
##  $8   2*x
##  $9   4*x
##  $10  23*x (x + 2*x + 4*x + 16*x)
##  $11  16*x

        .text
        .globl  main

main:
        ori     $7,$0,1         ##load register 7 with x value, remember that 23*x = 16*x + 4*x + 2*x + x
        sll     $8,$7,1         ##to calculate 2*x, shift x to the left one space
        sll     $9,$7,2         ##to calculate 4*x, shift x to the left two spaces
        sll     $11,$7,4        ##to calculate 16*x, shift x to the left four spaces
        addu    $10,$7,$8       ##add value stored in register 7 (x) to register 8 (2*x), store result in register 10
        addu    $10,$10,$9      ##add new value stored in register 10 (x + 2*x) to register 9 (4*x), store result in register 10
        addu    $10,$10,$11     ##add new value stored in register 10 (x + 2*x + 4*x) to register 11 (16*x), store result in register 10

## End of file