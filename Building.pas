unit Building;
interface
procedure Build;
implementation
uses
	crt,Variables;
procedure Build;
begin
	if (miner.facing=1) and (map.value[miner.onMap,miner.x-1,miner.y]=0) and (miner.inventory[miner.selected]>=1) then 
		begin
			if (miner.x=MinMapx+1) and (map.generated[miner.onMap-1]=true) then map.value[miner.onMap-1,MaxMapx,miner.y]:=miner.selected
			else if (miner.y=MaxMapy) and (map.generated[miner.onMap+60]=true) then map.value[miner.onMap+60,MinMapy,miner.x-1]:=miner.selected
			else if (miner.y=MinMapy) and (map.generated[miner.onMap-60]=true) then map.value[miner.onMap-60,MaxMapy,miner.x-1]:=miner.selected;
			if (miner.selected=5) and (Cheats.lavaPlacing=true) then map.value[miner.onMap,miner.x-1,miner.y]:=5
			else if (miner.selected>=1) and (miner.selected<=4) then  map.value[miner.onMap,miner.x-1,miner.y]:=miner.selected;
			if (cheats.unlimMaterials=false) then miner.inventory[miner.selected]:=miner.inventory[miner.selected]-1;
			gotoxy(miner.x-1,miner.y);
			if (miner.selected=1) then 
				begin
					textcolor(brown);
					write('D');
				end
			else if (miner.selected=2) then 
				begin
					textcolor(8); {grey}
					write('S');
				end
			else if (miner.selected=3) then 
				begin
					textcolor(yellow);
					write('I');
				end
			else if (miner.selected=4) then 
				begin
					textcolor(brown);
					write('W');
				end
			else if (miner.selected=5) and (Cheats.lavaPlacing=true) then 
				begin
					textcolor(red);
					write('L');
				end;
		end
	else if (miner.facing=2) and (map.value[miner.onMap,miner.x,miner.y+1]=0) and (miner.inventory[miner.selected]>=1) then 
		begin
			map.value[miner.onMap,miner.x,miner.y+1]:=miner.selected;
			if (map.generated[miner.onMap+60]=true) and (miner.y=MinMapy+1) and (miner.onMap<=540) then map.value[miner.onMap+60,miner.x,MinMapy]:=miner.selected
			else if (map.generated[miner.onMap-1]=true) and (miner.x=MinMapx) then map.value[miner.onMap-1,MaxMapx,miner.y+1]:=miner.selected
			else if (map.generated[miner.onMap+1]=true) and (miner.x=MaxMapx) then map.value[miner.onMap+1,MinMapx,miner.y+1]:=miner.selected;
			if (cheats.unlimMaterials=false) then miner.inventory[miner.selected]:=miner.inventory[miner.selected]-1;
			gotoxy(miner.x,miner.y+1);
			if (miner.selected=1) then 
				begin
					textcolor(brown);
					write('D');
				end
			else if (miner.selected=2) then 
				begin
					textcolor(8); {grey}
					write('S');
				end
			else if (miner.selected=3) then 
				begin
					textcolor(yellow);
					write('I');
				end
			else if (miner.selected=4) then 
				begin
					textcolor(brown);
					write('W');
				end
			else if (miner.selected=5) then 
				begin
					textcolor(red);
					write('L');
				end;
		end
	else if (miner.facing=3) and (map.value[miner.onMap,miner.x+1,miner.y]=0) and (miner.inventory[miner.selected]>=1) then 
		begin
			map.value[miner.onMap,miner.x+1,miner.y]:=miner.selected;
			if (miner.x=MaxMapx-1) and (map.generated[miner.onMap+1]=true) then map.value[miner.onMap+1,MinMapx,miner.y]:=miner.selected
			else if (miner.y=MaxMapy) and (map.generated[miner.onMap+60]=true) then map.value[miner.onMap+60,miner.x+1,MinMapy]:=miner.selected
			else if (miner.y=MinMapy) and (map.generated[miner.onMap-60]=true) then map.value[miner.onMap-60,miner.x+1,MaxMapy]:=miner.selected;
			if (cheats.unlimMaterials=false) then miner.inventory[miner.selected]:=miner.inventory[miner.selected]-1;
			gotoxy(miner.x+1,miner.y);
			if (miner.selected=1) then 
				begin
					textcolor(brown);
					write('D');
				end
			else if (miner.selected=2) then 
				begin
					textcolor(8); {grey}
					write('S');
				end
			else if (miner.selected=3) then 
				begin
					textcolor(yellow);
					write('I');
				end
			else if (miner.selected=4) then 
				begin
					textcolor(brown);
					write('W');
				end
			else if (miner.selected=5) then 
				begin
					textcolor(red);
					write('L');
				end;
		end
	else if (miner.facing=4) and (map.value[miner.onMap,miner.x,miner.y-1]=0) and (miner.inventory[miner.selected]>=1) then 
		begin
			map.value[miner.onMap,miner.x,miner.y-1]:=miner.selected;
			if (map.generated[miner.onMap-60]=true) and (miner.y=MinMapy+1) and (miner.onMap>=61) then map.value[miner.onMap-60,miner.x,MaxMapy]:=miner.selected
			else if (map.generated[miner.onMap-1]=true) and (miner.x=MinMapx) then map.value[miner.onMap-1,MaxMapx,miner.y-1]:=miner.selected
			else if (map.generated[miner.onMap+1]=true) and (miner.x=MaxMapx) then map.value[miner.onMap+1,MinMapx,miner.y-1]:=miner.selected;
			if (cheats.unlimMaterials=false) then miner.inventory[miner.selected]:=miner.inventory[miner.selected]-1;
			gotoxy(miner.x,miner.y-1);
			if (miner.selected=1) then 
				begin
					textcolor(brown);
					write('D');
				end
			else if (miner.selected=2) then 
				begin
					textcolor(8); {grey}
					write('S');
				end
			else if (miner.selected=3) then 
				begin
					textcolor(yellow);
					write('I');
				end
			else if (miner.selected=4) then 
				begin
					textcolor(brown);
					write('W');
				end
			else if (miner.selected=5) then 
				begin
					textcolor(red);
					write('L');
				end;
		end
	else miner.building:=false;
	textcolor(white);
end;
end.