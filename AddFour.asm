## CS 254 Program 1 Spring 2022
##
## Compute a + b + c + d
##
## Programmer: Andrew Weekes
## Date: 2/8/22
## Homework 1
  .text
  .globl main

main:
  ori  $4,$0,0x4  #put two's comp. four into register 4
  ori  $5,$0,0x5  #put two's comp. five into register 5
  ori  $6,$0,0x6  #put two's comp. six into register 6
  ori  $7,$0,0x7  #put two's comp. seven into register 7
  addu  $8,$4,$5  #add register 4 and 5 store in 8
  addu  $9,$6,$7  #add register 6 and 7 store in 9
  addu  $10,$8,$9 #add register 8 and 9, put result in 10

## End of file