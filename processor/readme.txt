# http://www.mrc.uidaho.edu/mrc/people/jff/digital/MIPSir.html

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

=================================================================
program_04:

    lw $s0, 4($s0)    ; 0x(8D-10-00-04)
    sw $s0, 24($s2)   ; 0x(AE-53-00-18)
    lw $s1, 24($s2)   ; 0x(8E-51-00-18)
    
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTES:
Instruction-1:
  lw  $s0,   4( $s0 )
  op   rt, imm(  rs )
  sw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  sw    |   $s0  |  $s0   |  4
  35    |   16   |   16   |  4
10-0011   1-0000   1-0000   0000-0000-0000-0100

1000 11ss ssst tttt iiii iiii iiii iiii  [lw]
1000-1110-0001-0000-0000-0000-0000-0100
 8    D    1    0    0    0    0    4
 0x(8D-10-00-04)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Instruction-2:
  sw  $s0,  24( $s2 )
  op   rt, imm(  rs )
  sw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  sw    |   $s2  |  $s0   |  24
  43    |   18   |   16   |  24
10-1011   1-0010   1-0000   0000-0000-0001-1000

1010 11ss ssst tttt iiii iiii iiii iiii [sw]
1010-1110-0101-0000-0000-0000-0001-1000
 A    E    5    3    0    0    1    8
 0x(AE-53-00-18)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Instruction-3:
  lw  $s1, 24( $s2 )
  op   rt, imm( rs )
  lw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  lw    |   $s2  |  $s1   |  24
  35    |   18   |   17   |  24
10-0011   1-0010   1-0001   0000-0000-0001-1000
	
1000 11ss ssst tttt iiii iiii iiii iiii  [lw]
1000-1110-0101-0001-0000-0000-0001-1000
 8    E    5    1    0    0    1    8
 0x(8E-51-00-18)

 =================================================================
program_05:
  Step 1: Place value in register via addi
  Step 2: Write value to memory
  Step 3: Read value from memory into register

    addi $s0, $zero, 1  ; 0x(22-00-00-01) // Step 1
    sw $s0, 24($zero)   ; 0x(AD-10-00-18) // Step 2
    lw $s1, 24($zero)   ; 0x(8C-11-00-18) // Step 3
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTES:
Instruction-1:
  addi $s0, $zero, 1
  op   rt,  rs,    imm

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  addi  |   $s0  |  $zer0 |  1
   8    |   16   |    0   |  1
00-1000   1-0000   0-0000   0000-0000-0000-0001

0010 00ss ssst tttt iiii iiii iiii iiii  [addi]
0010-0010-0000-0000-0000-0000-0000-0001
 2    2    0    0    0    0    0    1
 0x(22-00-00-01)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 Instruction-2:
  sw  $s0,  24($zero)
  op   rt, imm(  rs )
  sw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  sw    | $zero  |  $s0   |  24
  43    |   0    |   16   |  24
10-1011   0-0000   1-0000   0000-0000-0001-1000

1010 11ss ssst tttt iiii iiii iiii iiii [sw]
1010-1100-0001-0000-0000-0000-0001-1000
 A    D    1    0    0    0    1    8
 0x(AD-10-00-18)
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Instruction-3:
  lw  $s1, 24($zero)
  op   rt, imm( rs )
  lw dest, offset(base)

  op    |   rs   |   rt   | imm
[31:26]  [25:21]  [20:16]   [15:0]
 6-bits | 5-bits | 5-bits | 16-bits
  lw    | $zero  |  $s1   |  24
  35    |   0    |   17   |  24
10-0011   0-0000   1-0001   0000-0000-0001-1000
	
1000 11ss ssst tttt iiii iiii iiii iiii  [lw]
1000-1100-0001-0001-0000-0000-0001-1000
 8    C    1    1    0    0    1    8
 0x(8C-11-00-18)