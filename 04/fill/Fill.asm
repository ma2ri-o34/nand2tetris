// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
(LOOP)
  @i
  M=0
  @24576 // 押下されたキーの判別ワード
  D=M
  @NOTFILL
  D;JEQ  // M[24576]のいずれのbitも立っていないならJUMP
(FILL) // 
  @i
  D=M
  @8192 // スクリーンサイズは512 * 256 
  D=D-A 
  @LOOP
  D;JEQ // for(i=0, i=>8192, i++)
  @SCREEN 
  D=A
  @i
  A=D+M
  M=-1 //0xffffで1ワードすべて塗りつぶし
  @i
  M=M+1
  @FILL
  0;JMP
(NOTFILL)
  @i
  D=M 
  @8192
  D=D-A
  @LOOP
  D;JEQ // for(i=0, i=>8192, i++)
  @SCREEN
  D=A
  @i
  A=D+M
  M=0 //0x0000で1ワードすべて記述しない
  @i
  M=M+1
  @NOTFILL
  0;JMP
