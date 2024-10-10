extends Node2D


#determines spawn location
func _ready():
	if global.game_first_loadin == true:
		$player.position.x = global.player_start_posx
		$player.position.y = global.player_start_posy
		global.game_first_loadin = false
	elif global.enter_world2 == true:
		$player.position.x = global.player_enter_world2_posx
		$player.position.y = global.player_enter_world2_posy
		global.enter_world2 = false
	elif global.exit_world2_to_world == true: #and if global.game_first_loadin == false
		#not sure why this is not working
		$player.position.x = global.player_exit_world2_to_world_posx
		$player.position.y = global.player_exit_world2_to_world_posy
		global.exit_world2_to_world = false
	elif global.enter_cliff_side == true:
		$player.position.x = global.player_enter_cliffside_posx
		$player.position.y = global.player_enter_cliffside_posy
		global.enter_cliff_side = false
	elif global.exit_cliff_side_to_world == true:
		$player.position.x = global.player_exit_cliffside_posx
		$player.position.y = global.player_exit_cliffside_posy
		global.exit_cliff_side_to_world = false
	else:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scene_change_handler()

#cliffiside
func _on_cliffside_enter_point_body_entered(body):
	if body.has_method("player"):
		global.enter_cliff_side = true
		print("request change scene")
		scene_change_handler()

func _on_cliffside_enter_point_body_exited(body):
	if body.has_method("player"):
		pass
			
			
#world2 transition
func _on_world_2_enter_point_body_entered(body):
	if body.has_method("player"):
		print("requesting to change scene")
		global.enter_world2 = true
		scene_change_handler()


func _on_world_2_enter_point_body_exited(body):
	if body.has_method("player"):
		pass
		
		
func scene_change_handler():
	#handles changing destination_scene (outgoing)  💪
	if global.enter_world2 == true:
		print("scene_change_handler")
		global.destination_scene = "world_2"
		global.finish_changescenes()
		
	elif global.enter_cliff_side == true:
		print("scene_change_handler")
		global.destination_scene = "cliff_side"
		global.finish_changescenes()
		





