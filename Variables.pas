unit Variables;

interface

procedure setVariables;

type
	TMiner	=	record
		x				:integer;
		lastx			:integer;
		y				:integer;
		lasty			:integer;
		facing			:integer;
		moved			:boolean;
		jumping			:boolean;
		isMining		:boolean;
		building		:boolean;
		selected		:integer;
		health			:integer;
		onMap			:integer;
		inventory		:array[1..8] of integer;
	end;
	TControls = record
		left		:char;
		down		:char;
		right		:char;
		up			:char;
		jump		:char;
		mine		:char;
		build		:char;
		message		:char;
		pause		:char;
		inventory	:char;
	end;
	TMap	=	record
		value			:array[1..600,1..80,1..25] of integer;
		generated		:array[1..600] of boolean;
		save			:boolean;
	end;
	TSun	=	record
		lastx			:integer;
		x				:integer;
		visible			:boolean
	end;
	TMoon	= 	record
		lastx			:integer;
		x				:integer;
		visible			:boolean;
	end;
	TWorld	=	record
		time			:integer;
		timer			:integer;
		timeChanged		:boolean;
		sun				:TSun;
		moon			:TMoon;
	end;
	TCheats =	record
		unlimMaterials	:boolean;
		fly				:boolean;
		lavaPlacing		:boolean;
		noclip			:boolean;
	end;

const
	MaxMapx	= 80;
	MaxMapy	= 23;
	MinMapx = 1;
	MinMapy = 2;

var
	miner				:TMiner;
	map					:TMap;
	world				:TWorld;
	controls			:TControls;
	Cheats				:TCheats;
	globx				:integer;
	globy				:integer;
	lavaTick			:integer;
	healthTick			:integer;
	lavaFlowTick		:array[1..80,1..25] of integer;

implementation

procedure setVariables;
begin
	world.sun.visible:=true;
	world.moon.visible:=false;
	world.sun.x:=1;
	world.moon.x:=1;
	controls.left:='a';
	controls.down:='s';
	controls.right:='d';
	controls.up:='w';
	controls.jump:=' ';
	controls.mine:='#';
	controls.build:='~';
	controls.message:='t';
	controls.pause:=(chr(27));
	controls.inventory:='i';
	miner.selected:=1;
	miner.x:=2;
	miner.y:=5;
	miner.health:=100;
	miner.facing:=1;
	miner.onMap:=30;
end;
end.

