unit Talk;

interface

procedure message;

implementation

uses
	crt,Variables,SaveWorld;

procedure message; 
var
	arguments			:string;
	chatLogFile			:text;
	IOR					:integer;
begin
	gotoxy(2,24);
	readln(arguments);
	if (arguments='Cheat Unlimited Materials') then 
		begin
			if (Cheats.unlimMaterials=false) then Cheats.unlimMaterials:=true
			else if (Cheats.unlimMaterials=true) then Cheats.unlimMaterials:=false;
		end
	else if (arguments='Cheat Fly') then 
		begin
			if (Cheats.fly=true) then Cheats.fly:=false
			else if (Cheats.fly=false) then Cheats.fly:=true;
		end
	else if (arguments='Cheat Lava Placing') then 
		begin
			if (Cheats.lavaPlacing=true) then Cheats.LavaPlacing:=false
			else if (Cheats.lavaPlacing=false) then Cheats.lavaPlacing:=true;
			miner.inventory[5]:=100;
		end
	else if (arguments='noclip') then 
		begin
			if (Cheats.noclip=true) then Cheats.noclip:=false
			else if (Cheats.noclip=false) then Cheats.noclip:=true;
		end
	else if (arguments='Save') then Save;
	gotoxy(2,24);
	write('                                                 ');
	{WRITING TO TEXT FILE}
	assign(chatLogFile,'ChatLog.txt');
	{$I-}
   		Reset(chatLogFile);
	{$I+}
    IOR := IOResult;
    if IOR = 2 then rewrite(chatLogFile)
    else if IOR <> 0 then 
    	begin
    		append(chatLogFile);
			writeln(chatLogFile,arguments);
		end;
	close(chatLogFile);
	{FINISHED WRITING TO TEXT FILE}
end;

end.
