extends Node2D

@onready var button_mouse_enter = $"button mouse enter"
@onready var button_click = $button_click


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	button_click.play()
	global.game_first_loadin = true
	#global.player_dead = true
	global.destination_scene = "world"
	global.finish_changescenes()
	



func _on_exit_pressed():
	button_click.play()
	get_tree().quit()
	



func _on_start_mouse_entered():
	button_mouse_enter.play()




func _on_exit_mouse_entered():
	button_mouse_enter.play()
