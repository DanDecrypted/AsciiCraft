unit SaveWorld;
interface
function Save:boolean;
implementation
uses
	crt,SysUtils,Variables;
function Save:boolean;
var
	i,x,y			:integer;
	saveFile		:text;
	mapstring		:string;
	saveString		:string;
	IOR				:integer;
	worldNo			:integer;
	checkFile		:text;
	
begin
	gotoxy(2,MaxMapy+1);
	writeln('                                                                              ');
	worldNo:=0;
	repeat
		worldNo:=worldNo+1;
		writeln('checking world number ',worldNo);
		assign(checkFile,'Worlds/World '+chr(worldNo+48)+' Map 30.dat');
		{$I-}
			reset(checkFile);
		{$I+}
		IOR := IOResult;
		close(checkFile);
		writeln('Closed file');
	until(IOR=0);
	for i:=1 to 600 do 
		begin
			if (map.generated[i]=true) then 
				begin
					writeln('Before the map conversion');
					if (i>=10) and (i<=99) then mapstring:=chr(i div 10 + 48)+chr(i mod 10 +48)
					else if (i>=100) and (i<=600) then mapstring:=chr(i div 100 + 48)+chr(i div 10 + 48)+chr(i mod 100 +48)
					else mapstring:=chr(i+48);
					saveString:='Worlds/World '+chr(worldNo+48)+' Map '+mapstring+'.dat';
					assign(saveFile,saveString);
					rewrite(saveFile);
					writeln('saving file to ',saveString,'...');
					x:=1;
					y:=1;
					repeat
						repeat
							x:=x+1;
							write(saveFile,map.value[i,x,y]);
						until(x=MaxMapx);
					writeln(saveFile);
					x:=1;
					y:=y+1;
					until(y=MaxMapy);
					close(saveFile);
				end;
		end;
end;
end.
