unit MapRendering;
interface
procedure renderWorld;
procedure nextFrame;
implementation
uses
	crt,Variables;

procedure nextFrame;
begin
	gotoxy(miner.lastx,miner.lasty);
	if (map.value[miner.onMap,miner.lastx,miner.lasty]=1) then begin textcolor(brown); write('D'); end
	else if (map.value[miner.onMap,miner.lastx,miner.lasty]=2) then begin textcolor(8); write('S'); end
	else if (map.value[miner.onMap,miner.lastx,miner.lasty]=3) then begin textcolor(yellow); write('I'); end
	else if (map.value[miner.onMap,miner.lastx,miner.lasty]=4) then begin textcolor(brown); write('W'); end
	else if (map.value[miner.onMap,miner.lastx,miner.lasty]=5) then begin textcolor(red); write('L'); end
	else if (map.value[miner.onMap,miner.lastx,miner.lasty]=6) then begin textcolor(yellow); write('G'); end
	else write(' ');
	gotoxy(miner.x,miner.y);
	textcolor(white);
	write('A');
end;	

procedure renderWorld;
var
	x				:integer;
	y				:integer;
begin
	clrscr;
	x:=1;
	y:=1;
	repeat
		repeat
			if(map.value[miner.onMap,x,y]=1) then 
				begin
					gotoxy(x,y);
					textcolor(brown);
					write('D');
				end
			else if (map.value[miner.onMap,x,y]=2) then
				begin
					gotoxy(x,y);
					textcolor(8); {grey}
					write('S');
				end
			else if (map.value[miner.onMap,x,y]=3) then 
				begin
					gotoxy(x,y);
					textcolor(yellow);
					write('I');
				end
			else if (map.value[miner.onMap,x,y]=4) then
				begin
					gotoxy(x,y);
					textcolor(brown);
					write('W');
				end
			else if (map.value[miner.onMap,x,y]=5) then 
				begin
					gotoxy(x,y);
					textcolor(red);
					write('L')
				end
			else if (map.value[miner.onMap,x,y]=6) then 
				begin
					gotoxy(x,y);
					textcolor(yellow);
					write('G');
				end;
			x:=x+1;
		until(x=MaxMapx+1);
		x:=1;
		y:=y+1;
	until(y=MaxMapy+1);
	gotoxy(miner.x,miner.y);
	textcolor(white);
	write('A');
	gotoxy(1,24);
	write('[                                                                              ]');
end;
end.
