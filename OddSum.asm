## CS 254 Program 6
##
## Sum even and odd integers form 0 to N
##
## Programmer: Andrew Weekes
## Date: 3/23/22
##
## Register Use:
## $10   base address
## $11   N
## $12   even sum
## $13   odd sum
## $14   count
## $15   2, divide count by 2 to evaluate remainder
## $16   count < N
## $17   quotient of count / 2
## $18   remainder of count / 2

        .text
        .globl main

main:   lui     $10,0x1000          # fill upper half of register 10
        ori     $10,$10,0x0000      # fill lower half of register 10
        lw      $11,0($10)          # load value of N to register 11 

init:   ori     $12,$0,0            # even sum = 0
        ori     $13,$0,0            # odd sum = 0
        ori     $14,$0,0            # count = 0
        ori     $15,$0,2            # number to divide count by

test:   sltu    $16,$14,$11         # count < N
        beq     $16,$0,endLp        # end loop if count >= N
        sll     $0,$0,0             # branch delay slot
        divu    $14,$15             # divide current value of count by 2
        mflo    $17                 # place quotient in register 21
        mfhi    $18                 # place remainder in register 22
        beq     $18,$0,even         # branch to "even" if remainder is 0
        sll     $0,$0,0             # branch delay slot
        bne     $18,$0,odd          # branch to "odd" if remainder is not 0
        sll     $0,$0,0             # branch delay slot

even:   addu    $12,$12,$14         # add current value of count to even sum
        addiu   $14,$14,1           # increment value of count
        j       test                # jump to beginning of loop
        sll     $0,$0,0             # branch delay slot

odd:    addu    $13,$13,$14         # add current value of count to odd sum
        addiu   $14,$14,1           # increment value of count
        j       test                # jump to beginning of loop
        sll     $0,$0,0             # branch delay slot

endLp:  sll     $0,$0,0             # nop to end program
        sw      $12,0x04($10)       # store value of even sum to "evensum"
        sw      $13,0x08($10)       # store value of odd sum to "oddsum"

            .data
N:          .word   20              # change this line to change value of N
evensum:    .word   0               # holds the value of the even sum
oddsum:     .word   0               # holds the value of the odd sum

## End of file