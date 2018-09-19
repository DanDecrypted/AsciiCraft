unit LavaFlow;
interface
procedure lavaFlow;
implementation
uses
	crt,Variables;
procedure lavaFlow;
var
	x				:integer;
	y				:integer;
begin
	x:=1;
	y:=1;
	repeat
		repeat
			if (map.value[miner.onMap,x,y]=5) then
				begin
					if (map.value[miner.onMap,x,y+1]=0) and (y<MaxMapy) then 
						begin
							lavaFlowTick[x,y]:=lavaFlowTick[x,y]+1;
							if (lavaFlowTick[x,y]=30) then 
								begin
									map.value[miner.onMap,x,y+1]:=5;
									gotoxy(x,y+1);
									textcolor(red);
									write('L');
									lavaFlowTick[x,y]:=0;
								end;
						end
					else if (map.value[miner.onMap,x+1,y]=0) and (map.value[miner.onMap,x,y+1]<>5) and (x<MaxMapx) then 
						begin
							lavaFlowTick[x,y]:=lavaFlowTick[x,y]+1;
							if (lavaFlowTick[x,y]=80) then 
								begin
									map.value[miner.onMap,x+1,y]:=5;
									gotoxy(x+1,y);
									textcolor(red);
									write('L');
									lavaFlowTick[x,y]:=0;
								end;
						end
					else if (map.value[miner.onMap,x-1,y]=0) and (map.value[miner.onMap,x,y+1]<>5) and (x>MinMapx) then 
						begin
							lavaFlowTick[x,y]:=lavaFlowTick[x,y]+1;
							if (lavaFlowTick[x,y]=80) then 
								begin
									map.value[miner.onMap,x-1,y]:=5;
									gotoxy(x-1,y);
									textcolor(red);
									write('L');
									lavaFlowTick[x,y]:=0;
								end;
						end;
				end;
			x:=x+1;
		until(x=MaxMapx);
		x:=1;
		y:=y+1;
	until(y=MaxMapy);
	textcolor(white);
end;
end.