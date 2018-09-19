unit Mining;
interface
procedure Mine;
implementation
uses
	crt,Variables;
procedure Mine;
var
	i				:integer;
begin
	{Proceudre used to validate the mining}
	miner.isMining:=true;
	if (miner.facing=1) then
		begin
			if (miner.y=MaxMapy-1) then i:=map.value[miner.onMap+60,miner.x,MinMapy]
			else i:=map.value[miner.onMap,miner.x-1,miner.y];
			if (map.value[miner.onMap,miner.x-1,miner.y]<>0) and (map.value[miner.onMap,miner.x-1,miner.y]<>5) then 
				begin
					map.value[miner.onMap,miner.x-1,miner.y]:=0;
					if (map.generated[miner.onMap-1]=true) and (miner.x=MinMapx+1) then map.value[miner.onMap-1,MaxMapx,miner.y]:=0
					else if (map.generated[miner.onMap+60]=true) and (miner.y=MaxMapy) then map.value[miner.onMap+60,MinMapy,miner.x-1]:=0
					else if (map.generated[miner.onMap-60]=true) and (miner.y=MinMapy) then map.value[miner.onMap-60,MaxMapy,miner.x-1]:=0;
					miner.inventory[i]:=miner.inventory[i]+1;
					gotoxy(miner.x-1,miner.y);
					write(' ');
				end;
		end
	else if (miner.facing=2) then 
		begin
			i:=map.value[miner.onMap,miner.x,miner.y+1];
			if (map.value[miner.onMap,miner.x,miner.y+1]<>0) and (map.value[miner.onMap,miner.x,miner.y+1]<>5) then 
				begin
					map.value[miner.onMap,miner.x,miner.y+1]:=0;
					if (map.generated[miner.onMap-1]=true) and (miner.x=MinMapx) then map.value[miner.onMap-1,MaxMapx,miner.y]:=0
					else if (map.generated[miner.onMap+1]=true) and (miner.x=MaxMapx) then map.value[miner.onMap+1,MinMapx,miner.y]:=0
					else if (map.generated[miner.onMap+60]=true) and (miner.y=MaxMapy) then map.value[miner.onMap+60,MinMapy,miner.x-1]:=0;
					miner.inventory[i]:=miner.inventory[i]+1;
					gotoxy(miner.x,miner.y+1);
					write(' ');
				end;
		end
	else if (miner.facing=3) then 
		begin
			i:=map.value[miner.onMap,miner.x+1,miner.y];
			if (map.value[miner.onMap,miner.x+1,miner.y]<>0) and (map.value[miner.onMap,miner.x+1,miner.y]<>5) then 
				begin
					map.value[miner.onMap,miner.x+1,miner.y]:=0;
					if (map.generated[miner.onMap+1]=true) and (miner.x=MaxMapx-1) then map.value[miner.onMap+1,MinMapx,miner.y]:=0
					else if (map.generated[miner.onMap+60]=true) and (miner.y=MaxMapy) then map.value[miner.onMap+60,MinMapy,miner.x-1]:=0
					else if (map.generated[miner.onMap-60]=true) and (miner.y=MinMapy) then map.value[miner.onMap-60,MaxMapy,miner.x-1]:=0;
					miner.inventory[i]:=miner.inventory[i]+1;
					gotoxy(miner.x+1,miner.y);
					write(' ');
				end;
		end
	else if (miner.facing=4) then 
		begin
			i:=map.value[miner.onMap,miner.x,miner.y-1];
			if (map.value[miner.onMap,miner.x,miner.y-1]<>0) and (map.value[miner.onMap,miner.x,miner.y-1]<>5) then 
				begin
					if (map.generated[miner.onMap-1]=true) and (miner.x=MinMapx) then map.value[miner.onMap-1,MaxMapx,miner.y-1]:=0
					else if (map.generated[miner.onMap+1]=true) and (miner.x=MaxMapx) then map.value[miner.onMap+1,MinMapx,miner.y-1]:=0
					else if (map.generated[miner.onMap-60]=true) and (miner.y=MinMapy) then map.value[miner.onMap-60,miner.x,MaxMapy]:=0;
					map.value[miner.onMap,miner.x,miner.y-1]:=0;
					miner.inventory[i]:=miner.inventory[i]+1;
					gotoxy(miner.x,miner.y-1);
					write(' ');
				end;
		end;
end;
end.