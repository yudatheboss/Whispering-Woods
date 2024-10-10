extends Node2D

func _process(delta):
	change_scenes()

func _on_world_2_exitpoint_body_entered(body):
	if body.has_method("player"):
		global.destination_scene = "world"
		change_scenes()

func _on_world_2_exitpoint_body_exited(body):
	if body.has_method("player"):
		pass
		
		
func change_scenes():
	if global.destination_scene == "world":
		global.exit_world2_to_world = true
		#global.finish_changescenes()
	#if global.destination_scene == "world":
		global.finish_changescenes()
		







