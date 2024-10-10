extends Node2D
	

func _process(delta):
	change_scenes()

func _on_cliffside_exitpoint_body_entered(body):
	if body.has_method("player"):
		global.destination_scene = "world"
		change_scenes()
		
		


func _on_cliffside_exitpoint_body_exited(body):
	if body.has_method("player"):
		pass
		
func change_scenes():
	if global.destination_scene == "world": # and global.enter_cliff_side == true:
		global.exit_cliff_side_to_world = true
		global.finish_changescenes()
	

