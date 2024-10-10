extends Node2D
@onready var menu_music = $menu_music
@onready var world_music = $world_music
@onready var cliffside_music = $cliffside_music
@onready var world_2_music = $world2_music




# Called when the node enters the scene tree for the first time.
func _ready():
	play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_music():
	if global.current_music == "world":
		$cliffside_music.stop()
		$menu_music.stop()
		$world2_music.stop()
		if !$world_music.playing:
			$world_music.play()
	elif global.current_music == "cliffside_music":
		$world_music.stop()
		$menu_music.stop()
		$world2_music.stop()
		if !$cliffside_music.playing:
			$cliffside_music.play()
	elif global.current_music == "menu":
		$world_music.stop()
		$cliffside_music.stop()
		$world2_music.stop()
		if !$menu_music.playing:
			$menu_music.play()
	elif global.current_music == "world2_music":
		$world_music.stop()
		$cliffside_music.stop()
		$menu_music.stop()
		if !$world2_music.playing:
			$world2_music.play()
			
		
		
		
		
