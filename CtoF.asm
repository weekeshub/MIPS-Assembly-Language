## CS 254 Program 9
##
## Convert a temperature from Celsius to Fahrenheit.
## F = ( (C*9) /5) + 32
##
## Programmer: Andrew Weekes
## Date: 4/20/22
##
## Register use table:
## $f0  temp in celsius
## $f1  9.0
## $f2  5.0
## $f3  32.0
## $f4  converted temperature (fahrenheit)

        .text
        .globl main

main:

        l.s      $f1,nine             # load 9.0 into $f1
        l.s      $f2,five             # load 5.0 into $f2
        l.s      $f3,thirtytwo        # load 32.0 into $f3

        li        $v0,4               # load a 4 to print string
        la        $a0,prompt          # prompt user for temperature
        syscall

        li        $v0,6               # load a 6 into $v0 to read a float
        syscall                       

        mul.s     $f4,$f0,$f1         # C*9
        div.s     $f4,$f4,$f2         # (C*9) / 5
        add.s     $f4,$f4,$f3         # ((C*9) / 5) + 32

        li        $v0,4               # load a 4 to print string
        la        $a0,prompt2         # prompt for # in fahrenheit
        syscall

        mov.s     $f12,$f4            # $f12 = argument
        li        $v0,2               # load a 1 to print float
        syscall

        li        $v0,4               # load a 4 to print string
        la        $a0,newLine         # \n
        syscall

        li        $v0,4               # load a 4 to print string
        la        $a0,done            # done
        syscall
        
        li        $v0,10              # exit program
        syscall

            .data
prompt:     .asciiz     "Enter Celsius: "
prompt2:    .asciiz     "Fahrenheit: "
newLine:    .asciiz     "\n"
done:       .asciiz     "Done."
nine:       .float      9.0
five:       .float      5.0
thirtytwo:  .float      32.0