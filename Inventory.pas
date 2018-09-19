unit Inventory;
interface
procedure inventoryView;
implementation
uses
	crt,Variables,MapRendering;
procedure inventoryView;
var
	input			:char;
	i				:integer;
begin
	repeat
		i:=1;
		clrscr;
		writeln('DIRT: ',miner.inventory[1],'  ');
		writeln('STONE: ',miner.inventory[2],'  ');
		writeln('IRON: ',miner.inventory[3],'  ');
		writeln('WOOD: ',miner.inventory[4],'  ');
		repeat
			if (map.generated[i]=true) then writeln(i);
			i:=i+1;
		until(i=600);
		input:=readkey;
	until(input='i');
	renderWorld;
end;
end.