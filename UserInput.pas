unit UserInput;

interface

procedure readInput;

implementation

uses
	crt,Talk,Variables,Building,Mining,MapGenerationNew,MapRendering,TakeGiveHP,LavaFlow,Inventory,SaveWorld;

procedure readInput;
var
	input			:char;
	tick			:integer;
begin
	repeat
		repeat
			delay(10); {to stop people running too fast}
			{GRAVITY}
			if (map.value[miner.onMap,miner.x,miner.y+1]=0) and (miner.y<MaxMapy) and (Cheats.fly=false) 
			or (map.value[miner.onMap,miner.x,miner.y+1]=5) and (miner.y<MaxMapy) and (Cheats.fly=false) then 
				begin
					tick:=tick+1;
					if (tick=40) then 
						begin
							if (miner.y=MaxMapy) and (miner.onMap<=540) then
								begin
									miner.onMap:=miner.onMap+60;
									miner.y:=MinMapy+1;
									if (map.generated[miner.onMap]=false) then generateWorld(miner.onMap)
									else if (map.value[miner.onMap,miner.x,miner.y+1]=0) then renderWorld;
								end;
							miner.lasty:=miner.y;
							miner.lastx:=miner.x;
							miner.y:=miner.y+1;
							miner.jumping:=false;
							gotoxy(miner.lastx,miner.lasty);
							write(' ');
							textcolor(white);
							gotoxy(miner.x,miner.y);
							write('A');
							tick:=0;
						end;
				end
			else tick:=0;
			{END GRAVITY}
			if (map.value[miner.onMap,miner.x,miner.y]=5) then takeHP
			else if (map.value[miner.onMap,miner.x,miner.y+1]=5) then takeHP
			else if (map.value[miner.onMap,miner.x,miner.y-1]=5) then takeHP
			else if (miner.health<100) then giveHP;
			if (miner.jumping=true) then
				if (map.value[miner.onMap,miner.x,miner.y+1]<>0) then 
					miner.jumping:=false;
			if (keypressed) then 
				begin
					miner.lastx:=miner.x;
					miner.lasty:=miner.y;
					miner.isMining:=false;
					input:=readkey;
					    if (miner.x=MaxMapx) and (miner.onMap<60) and (input=controls.right) then 
							begin
								miner.onMap:=miner.onMap+1;
								miner.x:=MinMapx;
								miner.facing:=3;
								if (map.generated[miner.onMap]=false) then generateWorld(miner.onMap)
								else renderWorld;
							end
						else if (miner.x=MinMapx) and (miner.onMap>1) and (input=controls.left) then
							begin
								miner.onMap:=miner.onMap-1;
								miner.x:=MaxMapx;
								miner.facing:=1;
								if (map.generated[miner.onMap]=false) then generateWorld(miner.onMap)
								else renderWorld;
							end
						else if (miner.y=MaxMapy) and (miner.onMap<=540) then
							begin
								miner.onMap:=miner.onMap+60;
								miner.y:=MinMapy+1;
								if (map.generated[miner.onMap]=false) then generateWorld(miner.onMap)
								else renderWorld;
							end
						else if (miner.y=MinMapy) and (miner.onMap>=61) and (input=controls.jump) then 
							begin
								miner.onMap:=miner.onMap-60;
								miner.y:=maxMapy-1;
								if (map.generated[miner.onMap]=false) then generateWorld(miner.onMap)
								else renderWorld;
							end
						else if (input=controls.left) and (miner.facing=1) and (map.value[miner.onMap,miner.x-1,miner.y]=0) and (miner.x>1) or (Cheats.noclip=true) and (input=controls.left) then miner.x:=miner.x-1	  {Move Left}
						else if (input=controls.left) and (miner.facing=1) and (map.value[miner.onMap,miner.x-1,miner.y]=5) and (miner.x>1) or (Cheats.noclip=true) and (input=controls.left)  then miner.x:=miner.x-1	  {Move Left}
						else if (input=controls.down) and (miner.facing=2) and (Cheats.fly=true) and (map.value[miner.onMap,miner.x,miner.y+1]=0) or (Cheats.noclip=true) and (input=controls.down)  and (miner.y<MaxMapy) then miner.y:=miner.y+1 {Move Down}
						else if (input=controls.right) and (miner.facing=3) and (map.value[miner.onMap,miner.x+1,miner.y]=0) and (miner.x<MaxMapx) or (Cheats.noclip=true) and (input=controls.right)  then miner.x:=miner.x+1 {Move Right}
						else if (input=controls.right) and (miner.facing=3) and (map.value[miner.onMap,miner.x+1,miner.y]=5) and (miner.x<MaxMapx) or (Cheats.noclip=true) and (input=controls.right) then miner.x:=miner.x+1 {Move Right into lava}
						else if (input=controls.up) and (miner.facing=4) and (Cheats.fly=true) and (miner.x>=1) and (map.value[miner.onMap,miner.x,miner.y-1]=0) or (map.value[miner.onMap,miner.x,miner.y-1]=5) then miner.y:=miner.y-1
						else if (input=controls.jump) and (miner.jumping=false) then
							begin
								if (map.value[miner.onMap,miner.x,miner.y-1]=0) and (miner.y>1) then 
									begin
										miner.jumping:=true;
										miner.y:=miner.y-1;
										gotoxy(miner.lastx,miner.lasty);
										write(' ');
									end;
							end
						else if (input=controls.left) then miner.facing:=1
						else if (input=controls.down) then miner.facing:=2
						else if (input=controls.right) then miner.facing:=3
						else if (input=controls.up) then miner.facing:=4
						else if (input='1') then miner.selected:=1
						else if (input='2') then miner.selected:=2
						else if (input='3') then miner.selected:=3
						else if (input='4') then miner.selected:=4
						else if (input='5') then miner.selected:=5
						else if (input='6') then miner.selected:=6
						else if (input=controls.message) then message
						else if (input=controls.inventory) then inventoryView
						else if (input=chr(63)) then renderWorld {Refresh f5}
						else if (input=controls.mine) then Mine
						else if (input=controls.build) and (miner.inventory[miner. selected]>0) then Build;
						if (miner.lastx=miner.x) and (miner.lasty=miner.y) then miner.moved:=false
						else miner.moved:=true;
					if (miner.moved=true) then nextFrame;
				end;
		until(input=chr(27));
	until(input=chr(27));
end;

end.
