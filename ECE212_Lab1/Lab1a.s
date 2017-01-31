/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab1a.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/
move.l #0x23000000, %a2
move.l #ox23100000, %a3
move.l #100, %d2

loop:move.l (%a2), %d3
cmpi.l #0x0D, %d3
beq done
cmpi.l #102, %d3
bgt error
cmpi.l #96, %d3
bgt option1
cmpi.l #70, %d3
bgt error
cmpi.l #64, %d3
bgt option2
cmpi.l #57, %d3
bgt error
cmpi.l #47, %d3
bgt option3

error:move.l #0xFFFFFFFF, (%a3)
bra continue

option1:sub.l #87, %d3
move.l %d3, (%a3)
bra continue

option2:sub.l #55, %d3
move.l %d3, (%a3)
bra continue

option3:sub.l #48, %d3
move.l %d3, (%a3)

continue:add.l #4, %a2
add.l #4, %a3
sub.l #1, %d2
beq done
bra loop

done:


















/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
