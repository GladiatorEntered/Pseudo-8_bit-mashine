There are two files:
8bit_PU.vhd - the design file. Contains 4 inputs: Clk       - logical '0' or '1', a clock variable
                                                  operand1  - 8-bit input register
                                                  operand2  - 8-bit input register
                                                  operation - 3-bit register for an operation code

                                        1 output: result    - 8-bit output register for an operation result
8bit_Tb.vhd - an example of a testbench.

Operations: 000 - adding
            001 - substraction
            010 - bitwise OR
            011 - bitwise AND
            100 - bitwise NAND
            101 - bitwise XOR
            111 - returns 0xFF to the result register
            110 - return an error ("UUUUUUUU") to the result register

NUMBERS GREATER THEN 255 (0xFF) WILL BE TRUNCATED! 
