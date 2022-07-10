## CS 254 Program 10
##
## Calculate sin(x) in a Taylor series.
## sin(x) = x - x^3/3! + x^5/5! - x^7/7! + x^9/9! ......
##
## Programmer: Andrew Weekes
## Date: 4/25/22
##
## Register use table:
## $f0  x
## $f1  term
## $f2  sin
## $f3  numerator
## $f4  denominator
## $f5  n
## $f6  -1.0
## $f7  2.0
## $s0  count
## $s1  22

        .text
        .globl main

main:

        l.s      $f1,term          # load initial value of "term"
        l.s      $f2,sin           # load initial value of "sin"

        li       $v0,4             # load a 4 to print string
        la       $a0,promptX       # prompt user to enter a number for x
        syscall

        li       $v0,6             # load a 6 into $v0 to read a float
        syscall

        mov.s    $f1,$f0           # term = x
        mov.s    $f2,$f0           # sin = x

        l.s      $f5,N             # n = 3
        l.s      $f6,negativeOne   # used for (n - 1)
        l.s      $f7,two           # n += 2
        li       $s0,3             # count starts at 3
        li       $s1,22            # n <= 21

loop:

        bgtu     $s0,$s1,end       # if n > 21, break out of loop

        mul.s    $f3,$f0,$f0       # x * x = x^2
        mul.s    $f3,$f3,$f1       # term * x * x
        neg.s    $f3,$f3           # -(term * x * x)

        add.s    $f4,$f5,$f6       # (n - 1)
        mul.s    $f4,$f5,$f4       # n * (n - 1)

        div.s    $f1,$f3,$f4       # term = -(term * x * x) / (n * (n - 1))

        add.s    $f2,$f2,$f1       # sin += term
        addiu    $s0,$s0,2         # count += 2
        add.s    $f5,$f5,$f7       # n += 2

        b        loop              # return to beginning of loop



end:

        li       $v0,4             # load a 4 to print string
        la       $a0,promptSin     # Sin(x)
        syscall

        mov.s    $f12,$f2          # $f12 = argument
        li       $v0,2             # load a 2 to print float
        syscall

        li       $v0,4             # load a 4 to print string
        la       $a0,newLine       # \n
        syscall

        li       $v0,4             # load a 4 to print string
        la       $a0,done          # done
        syscall

        li       $v0,10            # exit program
        syscall




              .data

promptX:      .asciiz     "Enter x: "
promptSin:    .asciiz     "Sin(x) : "
term:         .float      0.0
sin:          .float      0.0
N:            .float      3.0
twentyTwo:    .word       22
negativeOne:  .float      -1.0
two:          .float      2.0
newLine:      .asciiz     "\n"
done:         .asciiz     "Done."