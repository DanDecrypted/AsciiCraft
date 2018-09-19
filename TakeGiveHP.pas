unit TakeGiveHP;
interface
procedure takeHP;
procedure giveHP;
implementation
uses
	crt,Variables,MapRendering;
procedure showHP;
begin
	gotoxy(1,1);
	textcolor(white);
	write('HEALTH: ',miner.health,'  ');
end;

procedure giveHP;
begin
	lavaTick:=0;
	healthTick:=healthTick+1;
	if (healthTick=50) and (miner.health<=100) then 
		begin
			miner.health:=miner.health+2;
			if (miner.health>100) then miner.health:=100;
			healthTick:=0;
			showHP;
		end;
end;

procedure takeHP;
begin
	healthTick:=0;
	lavaTick:=lavaTick+1;
	if (lavaTick=30) and (miner.health>=2) then 
		begin
			miner.health:=miner.health-2;
			lavaTick:=0;
			showHP;
		end;
	if (miner.health<0) then miner.health:=0;
end;
end.