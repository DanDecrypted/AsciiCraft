unit MapGeneration;
interface
procedure generateWorld(GMap:integer);
procedure deleteTree;
implementation
uses
	crt,Variables,MapRendering;

procedure generateWorld(GMap:integer);
var
	x				:integer;
	y				:integer;
	randomint		:integer;
begin
	y:=MinMapy;
	x:=MinMapx;
	randomize;
	repeat
		repeat
			randomint:=random(100)+1;
			if (GMap<=60) then 
				begin
					if (y>=5) and (y<=9) then 
						begin
							if (map.value[GMap,x,y-1]=4) then map.value[GMap,x,y]:=4 {Spawning a tree if there's wood above it}
							else if (randomint>=1) and (randomint<=10) then Map.value[GMap,x,y]:=4 {if there isnt a tree, 10% chance there will be wood spawning}
							else map.value[GMap,x,y]:=0; {90% chance there's going to be nothing}
						end
					else if (y=10) then 
						begin
							if (map.value[GMap,x-1,y]=1) or (map.value[GMap,x-1,y]=2) then 
								begin
									if (randomint>=1) and (randomint<=80) then map.value[GMap,x,y]:=1
									else if (randomint>=81) and (randomint<=90) then map.value[GMap,x,y]:=2
									else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
								end
							else if (map.value[GMap,x-1,y]=0) then 
								begin
									if (randomint>=1) and (randomint<=70) then map.value[GMap,x,y]:=1
									else if (randomint>=71) and (randomint<=80) then map.value[GMap,x,y]:=2
									else if (randomint>=81) and (randomint<=100) then map.value[GMap,x,y]:=0;
								end
							else
								begin
									if (randomint>=1) and (randomint<=80) then map.value[GMap,x,y]:=1
									else if (randomint>=81) and (randomint<=90) then map.value[GMap,x,y]:=2
									else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
								end;
								
							if (map.value[GMap,x,y]=0) and (map.value[GMap,x,y-1]=4) then {Wood}
								begin
									globx:=x; {x is a local variable so globx is used to export the variable value}
									globy:=y;
									deleteTree;
								end;
						end
					else if (y>=11) and (y<=MaxMapy) then 
						begin
							if (map.value[GMap,x-1,y]=1) then
								begin
									if (randomint>=1) and (randomint<=80) then map.value[GMap,x,y]:=1
									else if (randomint>=81) and (randomint<=90) then map.value[GMap,x,y]:=2
									else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
								end
							else if (map.value[GMap,x-1,y]=2) then 
								begin
									if (randomint>=1) and (randomint<=30) then map.value[GMap,x,y]:=1
									else if (randomint>=31) and (randomint<=90) then map.value[GMap,x,y]:=2
									else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
								end
							else if (map.value[GMap,x,y-1]=0) then 
								begin
									if (randomint>=1) and (randomint<=40) then map.value[GMap,x,y]:=0
									else if (randomint>=41) and (randomint<=80) then map.value[GMap,x,y]:=1
									else if (randomint>=81) and (randomint<=100) then map.value[GMap,x,y]:=2;
								end
							else if (map.value[GMap,x-1,y]=0) then 
								begin
									if (randomint>=1) and (randomint<=60) then map.value[GMap,x,y]:=0
									else if (randomint>=61) and (randomint<=80) then map.value[GMap,x,y]:=1
									else if (randomint>=81) and (randomint<=100) then map.value[GMap,x,y]:=2;
								end
							else
								begin
									if (randomint>=1) and (randomint<=50) then map.value[GMap,x,y]:=1
									else if (randomint>=51) and (randomint<=90) then map.value[GMap,x,y]:=2
									else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
								end;
						end;
				end
			else if (GMap>=61) and (GMap<=180) then 
				begin
					if (map.value[GMap,x-1,y]=1) then
						begin
							if (randomint>=1) and (randomint<=70) then map.value[GMap,x,y]:=1
							else if (randomint>=71) and (randomint<=80) then map.value[GMap,x,y]:=2
							else if (randomint>=81) and (randomint<=90) then map.value[GMap,x,y]:=3
							else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
						end
					else if (map.value[GMap,x-1,y]=2) then 
						begin
							if (randomint>=1) and (randomint<=20) then map.value[GMap,x,y]:=1
							else if (randomint>=21) and (randomint<=30) then map.value[GMap,x,y]:=3
							else if (randomint>=31) and (randomint<=90) then map.value[GMap,x,y]:=2
							else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
						end
					else if (map.value[GMap,x,y-1]=0) then 
						begin
							if (randomint>=1) and (randomint<=40) then map.value[GMap,x,y]:=0
							else if (randomint>=41) and (randomint<=80) then map.value[GMap,x,y]:=1
							else if (randomint>=81) and (randomint<=100) then map.value[GMap,x,y]:=2;
						end
					else if (map.value[GMap,x-1,y]=3) then 
						begin
							if (randomint>=1) and (randomint<=10) then map.value[GMap,x,y]:=0
							else if (randomint>=11) and (randomint<=20) then map.value[GMap,x,y]:=1
							else if (randomint>=21) and (randomint<=50) then map.value[GMap,x,y]:=2
							else if (randomint>=51) and (randomint<=100) then map.value[GMap,x,y]:=3;
						end
					else if (map.value[GMap,x-1,y]=0) then 
						begin
							if (randomint>=1) and (randomint<=40) then map.value[GMap,x,y]:=0
							else if (randomint>=41) and (randomint<=60) then map.value[GMap,x,y]:=1
							else if (randomint>=61) and (randomint<=80) then map.value[GMap,x,y]:=2
							else if (randomint>=80) and (randomint<=100) then map.value[GMap,x,y]:=3;
						end
					else
						begin
							if (randomint>=1) and (randomint<=40) then map.value[GMap,x,y]:=1
							else if (randomint>=41) and (randomint<=70) then map.value[GMap,x,y]:=2
							else if (randomint>=71) and (randomint<=90) then map.value[GMap,x,y]:=3
							else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=0;
						end;
				end
			else if (GMap>=181)  then 
				begin
					if (map.value[GMap,x-1,y]=0) then 
						begin
							if (randomint>=1) and (randomint<=30) then map.value[GMap,x,y]:=0
							else if (randomint>=31) and (randomint<=50) then map.value[GMap,x,y]:=2
							else if (randomint>=51) and (randomint<=80) then map.value[GMap,x,y]:=3
							else if (randomint>=81) and (randomint<=98) then map.value[GMap,x,y]:=5
							else if (randomint>=99) and (randomint<=100) then map.value[GMap,x,y]:=6;
						end
					else if (map.value[GMap,x-1,y]=2) then 
						begin
							if (randomint>=1) and (randomint<=5) then map.value[GMap,x,y]:=0
							else if (randomint>=6) and (randomint<=30) then map.value[GMap,x,y]:=2
							else if (randomint>=31) and (randomint<=70) then map.value[GMap,x,y]:=3
							else if (randomint>=71) and (randomint<=98) then map.value[GMap,x,y]:=5
							else if (randomint>=99) and (randomint<=100) then map.value[GMap,x,y]:=6;
						end
					else if (map.value[GMap,x,y-1]=0) then 
						begin
							if (randomint>=1) and (randomint<=40) then map.value[GMap,x,y]:=0
							else if (randomint>=41) and (randomint<=70) then map.value[GMap,x,y]:=2
							else if (randomint>=71) and (randomint<=90) then map.value[GMap,x,y]:=3
							else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=5;
						end
					else if (map.value[GMap,x-1,y]=3) then 
						begin
							if (randomint>=1) and (randomint<=5) then map.value[GMap,x,y]:=0
							else if (randomint>=6) and (randomint<=30) then map.value[GMap,x,y]:=2
							else if (randomint>=31) and (randomint<=80) then map.value[GMap,x,y]:=3
							else if (randomint>=81) and (randomint<=96) then map.value[GMap,x,y]:=5
							else if (randomint>=97) and (randomint<=100) then map.value[GMap,x,y]:=6;
						end
					else if (map.value[GMap,x-1,y]=5) then 
						begin
							if (randomint>=1) and (randomint<=10) then map.value[GMap,x,y]:=0
							else if (randomint>=11) and (randomint<=20) then map.value[GMap,x,y]:=2
							else if (randomint>=21) and (randomint<=45) then map.value[GMap,x,y]:=3
							else if (randomint>=46) and (randomint<=90) then map.value[GMap,x,y]:=5
							else if (randomint>=91) and (randomint<=100) then map.value[GMap,x,y]:=6;
						end
					else if (map.value[GMap,x-1,y]=6) then 
						begin
							if (randomint>=1) and (randomint<=10) then map.value[GMap,x,y]:=0
							else if (randomint>=11) and (randomint<=30) then map.value[GMap,x,y]:=2
							else if (randomint>=31) and (randomint<=50) then map.value[GMap,x,y]:=3
							else if (randomint>=51) and (randomint<=60) then map.value[GMap,x,y]:=5
							else if (randomint>=61) and (randomint<=100) then map.value[GMap,x,y]:=6
						end;
				end;
			x:=x+1;
		until(x=MaxMapx+1);
		x:=MinMapx;
		y:=y+1;
	until(y=MaxMapy+1);
	if map.generated[GMap+60]=true then {If the map below has already been generated}
		begin
			x:=1;
			y:=MaxMapy;
			repeat
				map.value[GMap,x,y]:=map.value[GMap+60,x,MinMapy];
				x:=x+1;
			until(x=MaxMapx+1);
		end
	else if map.generated[GMap-60]=true then {If the map above has already been generated}
		begin
			x:=1;
			y:=MinMapy;
			repeat
				map.value[GMap,x,y]:=map.value[GMap-60,x,MaxMapy];
				x:=x+1;
			until(x=MaxMapx+1);
		end
	else if map.generated[GMap+1]=true then {If the map to the right has already been generated}
		begin
			x:=MaxMapx;
			y:=1;
			repeat
				map.value[GMap,x,y]:=map.value[GMap+1,MinMapx,y];
				y:=y+1;
			until(y=MaxMapy+1);
		end
	else if map.generated[GMap-1]=true then {If the map to the left has already been generated}
		begin
			x:=MinMapx;
			y:=1;
			repeat
				map.value[Gmap,x,y]:=map.value[GMap-1,MaxMapx,y];
				y:=y+1;
			until(y=MaxMapy+1);
		end;
	map.generated[GMap]:=true;
	if (map.value[GMap,miner.x,miner.y]<>0) then map.value[GMap,miner.x,miner.y]:=0;
	renderWorld;
end;

procedure deleteTree; {Stopping the tree's spawning in the air.}
var
	x				:integer;
	y				:integer;
begin
	x:=globx;
	y:=globy;
	while (map.value[miner.onMap,x,y-1]=4) do 
		begin
			map.value[miner.onMap,x,y-1]:=0;
			y:=y-1;
		end;
end;

end.
