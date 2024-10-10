extends Node2D
@onready var button_mouse_enter = $"button mouse enter"
@onready var button_click = $button_click


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	button_click.play()
	global.game_first_loadin = true
	global.player_dead = false
	global.destination_scene = "world"
	global.finish_changescenes()
	



func _on_main_menu_pressed():
	button_click.play()
	global.game_first_loadin = true
	global.player_dead = false
	global.destination_scene = "main_menu"
	global.finish_changescenes()
	
	
	


func _on_restart_mouse_entered():
	button_mouse_enter.play()


func _on_main_menu_mouse_entered():
	button_mouse_enter.play()
