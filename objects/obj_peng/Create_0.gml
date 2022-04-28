
//determines whether or not peng is in the sliding animation.
function is_active(){
	if(global.ice_array[global.peng_index].x == x && global.ice_array[global.peng_index].y == y){
		return false;
	}
	else{
		return true;
	}
	
}


//checks if the penguin is in the same tile as the end index. if true, the game is won
function check_win(){
	if(x >= global.ice_array[global.end_index].x && x < global.ice_array[global.end_index].x + 64  && y >= global.ice_array[global.end_index].y && y < global.ice_array[global.end_index].y + 64){
		room_goto(rm_win);
	}
}
