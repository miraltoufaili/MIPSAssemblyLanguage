# The assembler directive .data is used to request memory to store values
.data
theArray:
  .space 160
  .text

testing:
  li    $t6, 1          # Set $t6 to A
  li    $t7, 2          # Sets $t7 to B
  li	$t8, 3		# Sets $t8 to C
  li	$t9, 4		# Sets $t9 to D
  
  li	$s0, 4	# Set $s0 to 4
  li	$s1, 8 # Set s1 to 8
  li	$s2, 12 # Set s2 to 12
  
  sw    $t6, theArray($0)   # Load $t6 into memory location theArray[0]
  sw    $t7, theArray($s0)  # Load $t7 into memory location theArray[1]
  # We must multiply by 4 because the memory is stored as 4 bytes per word
  sw	$t8, theArray($s1)  # Load $t8 into memory location theArray[2]
  sw	$t9, theArray($s2)  #Load $t9 into memory location theArray[3]
 main:
  lw	$t0, theArray($0) # Load the value of theArray[0] into $t0
  lw	$t1, theArray($s0) # Load the value of theArray[0] into $t1
  lw	$t2, theArray($s1) # Load the value of theArray[0] into $t2
  lw	$t3, theArray($s2) # Load the value of theArray[0] into $t3
  
 mult $t0, $t1 #multiply A and B
 mfhi $a0 # Store upper 32 bits result into $a0
 mflo $v0 # Store lower 32 bits result into $v0
 
 mult $t2, $t3 #Multiply C and D
 mfhi $a1 # Store upper 32 bits result into $a1
 mflo $v1 # Store lower 32 bits result into $v1
 
 add $a2, $a0, $a1 # Add the top 32 bits
 add $a3, $v0, $v1 # Add the low 32 bits. Result of the operation

# The result of the operation is generally stored in $a3.
# Use $a2 if the result is higher than 32 bits
