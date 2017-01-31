/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab1b.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/
move.l #0x2300000, %a2
move.l #0x2310000, %a3
move.l #100, %d2

loop:move.l (%a2), %d3
cmpi.l #0x0D, %d3
beq done
cmpi.l #122, %d3
bgt error
cmpi.l #96, %d3
bgt option1
cmpi.l #90, %d3
bgt error
cmpi.l #64, %d3
bgt option2

error:move.l #0xFFFFFFFF, (%a3)
bra continue

option1:sub.l #32, %d3
move.l %d3, (%a3)
bra continue

option2:add.l #32, %d3
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
