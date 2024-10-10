extends Node
#var health_pickup = false

var player_current_attack = false
var destination_scene = "world" #world cliff_slide
var current_music = "menu"
#spawn variables
#start spawn (game_first_loadin)
var player_start_posx = -304
var player_start_posy = -104

#world2 enter/exit positions
#enter spawn
var player_enter_world2_posx = -334
var player_enter_world2_posy = -115
#exit spawn
var player_exit_world2_to_world_posx = 341
var player_exit_world2_to_world_posy = 75

#cliff_side enter/exit positions
#enter spawn
var player_enter_cliffside_posx = -80
var player_enter_cliffside_posy = -160
#exit spawn
var player_exit_cliffside_posx = -80
var player_exit_cliffside_posy = -178

#to be used in conditionals for spawn points (may not need exits/only for spawn locations)
#first load in
var game_first_loadin = true
#enter/exit cliffside
var enter_cliff_side = false
var exit_cliff_side_to_world = false
#enter/exit world2
var enter_world2 = false
var exit_world2_to_world = false

#death_menu
var player_dead = false

#change scenes scene_change_handler is doing the heavy lifting
func finish_changescenes():
	if game_first_loadin == true and destination_scene == "world":
		current_music = "world"
		backround_music.play_music()
		get_tree().change_scene_to_file("res://scenes/world.tscn")
		game_first_loadin = false
	elif enter_cliff_side == true and destination_scene == "cliff_side":
		current_music = "cliffside_music"
		backround_music.play_music()
		get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
		enter_cliff_side = false
	elif enter_world2 == true and destination_scene == "world_2":
		current_music = "world2_music"
		backround_music.play_music()
		get_tree().change_scene_to_file("res://scenes/world_2.tscn")
		enter_world2 = false
	elif exit_cliff_side_to_world == true and destination_scene == "world":
		current_music = "world"
		game_first_loadin = false
		backround_music.play_music()
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	elif exit_world2_to_world == true and destination_scene == "world":
		current_music = "world"
		game_first_loadin = false
		backround_music.play_music()
		get_tree().change_scene_to_file("res://scenes/world.tscn")
		
		
		
		#menus
	elif player_dead == true and destination_scene == "death":
		current_music = "menu"
		get_tree().change_scene_to_file("res://scenes/death.tscn")
		backround_music.play_music()
		player_dead = false
	elif player_dead == false and destination_scene == "main_menu":
		current_music = "menu"
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
		backround_music.play_music()
	
		
		
		
		
		
		
		
