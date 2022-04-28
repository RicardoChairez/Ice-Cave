//grid dimension integer
global.grid_dimension = 15;

//index of what ice block peng is currently on
global.peng_index = 16;

//index of the starting position
global.start_index = 16;

//index of the end/winning position
global.end_index = 196;

//2d array of ice tiles
global.ice_array = array_create(global.grid_dimension * global.grid_dimension);

var lyr_instances = layer_get_id("Instances");

//width of ice sprite
var ice_width = sprite_get_width(spr_ice);

//For loop that initializes the array with obj_ice instances
for(var i = 0; i < global.grid_dimension; i++){
	for(var j = 0; j < global.grid_dimension; j++){
		var _x = j * ice_width;
		var _y = i * ice_width;
		var inst_ice = instance_create_layer(_x, _y, lyr_instances, obj_ice)
		global.ice_array[i * global.grid_dimension + j] = inst_ice;
	}
}

//Manually adds barriers in different locations
global.ice_array[1+5*15].set_barrier(spr_barrier);
global.ice_array[5+3*15].set_barrier(spr_barrier);
global.ice_array[11+8*15].set_barrier(spr_barrier);
global.ice_array[13+11*15].set_barrier(spr_barrier);
global.ice_array[1+12*15].set_barrier(spr_barrier);
global.ice_array[6+9*15].set_barrier(spr_barrier);
global.ice_array[10+12*15].set_barrier(spr_barrier);
global.ice_array[10+3*15].set_barrier(spr_barrier);
global.ice_array[13+5*15].set_barrier(spr_barrier);
global.ice_array[105].set_barrier(spr_barrier);
global.ice_array[117].set_barrier(spr_barrier);
global.ice_array[150].set_barrier(spr_barrier);
global.ice_array[176].set_barrier(spr_barrier);
global.ice_array[183].set_barrier(spr_barrier);
global.ice_array[167].set_barrier(spr_barrier);
global.ice_array[166].set_barrier(spr_barrier);
global.ice_array[32].set_barrier(spr_barrier);
global.ice_array[42].set_barrier(spr_barrier);
global.ice_array[19].set_barrier(spr_barrier);
global.ice_array[12+13*15].set_barrier(spr_barrier);
global.ice_array[6+8*15].set_barrier(spr_barrier);
global.ice_array[5+12*15].set_barrier(spr_barrier);
global.ice_array[11+10*15].set_barrier(spr_barrier);
global.ice_array[8+13*15].set_barrier(spr_barrier);
global.ice_array[12+8*15].set_barrier(spr_barrier);



//adds top wall
for(i = 0; i < 15; i++)
{
	if(i != global.start_index)
	{
		global.ice_array[i].set_barrier(spr_wallup);
	}
	
}
//adds bottom wall
for(i =210 ; i<225; i++)
{
	if(i != global.end_index)
	{
		global.ice_array[i].set_barrier(spr_walldown);
	}
	
	
}

//starts with manually adding left wall at 
for(i = 15; i < 211; i++)
{	
	
	if(i % 15 == 0)
	{
		global.ice_array[i-1].set_barrier(spr_wallright);
		global.ice_array[i].set_barrier(spr_wallleft);
	}
}

//Manually adds wall corners
global.ice_array[0].set_barrier(spr_walltopleft);
global.ice_array[14].set_barrier(spr_walltopright);
global.ice_array[210].set_barrier(spr_walldownleft);
global.ice_array[224].set_barrier(spr_walldownright);

//Creates peng
inst_peng = instance_create_layer(global.ice_array[global.peng_index].x, global.ice_array[global.peng_index].y, lyr_instances, obj_peng);
inst_peng.depth = -1000;

//Creates fish
inst_fish = instance_create_layer(global.ice_array[global.end_index].x, global.ice_array[global.end_index].y, lyr_instances, obj_fish);
inst_fish.depth = -1000;

audio_play_sound(cold,0,true);

