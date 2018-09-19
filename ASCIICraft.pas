program AsciiMinecraft;
{ASCIICraft written, and developed by Dan Scott (c) 2011-2012 all rights reserved.
TODO: Fix Time (Sun moving and stuff), completely Debug, finish rerwitting world generation code, adding more materials.}
uses
	crt,Talk,Variables,MapGenerationNew,MapRendering,UserInput,Building;

begin
	clrscr;
	setVariables;
	generateWorld(miner.onMap);
	readInput;
end.
