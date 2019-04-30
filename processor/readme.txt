program_00:
    lw $s3, -24($s4)  ; Machine: 0x8E93FFe8

program_01:
    lw $s3, 1($s4)    ; Machine: 0x8E930001

program_02:
    lw $s3, 4($s4)    ; Machine: 0x8E930004
    lw $s3, 8($s4)    ; Machine: 0x8E930008
    lw $s3, 12($s4)   ; Machine: 0x8E93000C
    lw $s3, 16($s4)   ; Machine: 0x8E930010
    lw $s3, 20($s4)   ; Machine: 0x8E930014

program_03:
    lw $s0, 4($s1)    ; Machine: 0x8E300004
    lw $s0, 8($s1)    ; Machine: 0x8E300008
    lw $s0, 12($s1)   ; Machine: 0x8E30000C
    lw $s0, 16($s1)   ; Machine: 0x8E300010
    lw $s0, 20($s1)   ; Machine: 0x8E300014
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTES:
lw  $s0, 4(     $s1 )   ; Machine: 0x8E300004 // 0x(8E-30-00-04)
op   rt, imm(    rs )
lw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  lw    |   $s1  |  $s0   |  4
  35    |   17   |   16   |  4
10-0011   1-0001   1-0000   0000-0000-0000-0100

1000-1110-0011-0000-0000-0000-0000-0100
 8    E    3    0    0    0    0    4
 
0x(8E-30-00-01)

Base-10     Base-2
  35        10-0011
  17         1-0001
  16         1-0000
   4         0-0100
=================================================================
program_04:
    lw $s3, 4($s4)    ; Machine: 0x8E930004
    lw $s3, 8($s4)    ; Machine: 0x8E930008
    sw $s3, 0($s4)    ; Machine: 0x9E300000 // $s4 contains zero
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTES:
sw  $s0, 4(     $s1 )   ; Machine: 0x9E300000 // 0x(9E-30-00-00)
op   rt, imm(    rs )
lw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  lw    |   $s1  |  $s0   |  0
  43    |   17   |   16   |  0
10-1011   1-0001   1-0000   0000-0000-0000-0000

1010-1110-0011-0000-0000-0000-0000-0000
 9    E    3    0    0    0    0    0
 
0x(8E-30-00-01)

Base-10     Base-2
  35        10-0011
  17         1-0001
  16         1-0000
   4         0-0100
