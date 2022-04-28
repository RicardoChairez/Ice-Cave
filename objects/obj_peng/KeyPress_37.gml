//if peng is not moving, finds the nearest barrier and tweens over to the ice right of that barrier
//if out of bounds, peng is returned to the starting position. this is impossible in the level but could be used in the future
if(!is_active()){
	var out_bounds = false;
	while(global.ice_array[global.peng_index].barrier == false && !out_bounds){
		global.peng_index--;
		if(global.ice_array[global.peng_index].x == 896){
			out_bounds = true;
			global.peng_index = global.start_index;
		}
	}
	if(!out_bounds){
		global.peng_index++;
	}
	sprite_index = spr_left;
	TweenEasyMove(x,y,global.ice_array[global.peng_index].x,global.ice_array[global.peng_index].y,0,50,EaseInOutQuad);
}