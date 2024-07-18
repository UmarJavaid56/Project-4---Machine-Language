// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(BEGIN)
// Set keyboard to address for keyboard input value.
@24576
D=A
@keyboard
M=D

(CHECK_KEYBOARD)
// Set current to last screen pixel map.
@24575
D=A
@current
M=D

// If keyboard is pressed, fill the screen.
@keyboard
A=M
D=M
@fillvalue
M=-1
@DRAW
D;JNE

//Otherwise, clear the screen.
@fillvalue
M=0

(DRAW)
// Fill or clear current pixel, depending on fillvalue.
@fillvalue
D=M
@current
A=M
M=D

// If current pixel map is the first pixel map, there is nothing left to draw.
@current
D=M
@FIRST_PIXEL_MAP
D=D-A
@CHECK_KEYBOARD
D;JLE


// Decrement current pixel map and continue drawing the next pixel map.
@current
M=M-1
@DRAW
0;JMP

