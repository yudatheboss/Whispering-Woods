extends CharacterBody2D
@onready var swordhit = $swordhit
@onready var walk = $walk

#global script communicatio
var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true

var attack_ip = false

const speed = 100
var current_dir = "none"

#play idle
func _ready():
	$AnimatedSprite2D.play("front_idle")

#run at every second
func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	current_camera()
	update_health()
	#health
	if health <= 0:
		player_alive = false #go back to menu or respawn
		health = 0
		print("player has been killed")
		global.player_dead = true
		global.destination_scene = "death"
		global.current_music = "menu"
		self.queue_free()
		menu_scene_change_handler()
		
	
func player_movement(delta):
	#ANIMATIONS
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	
	#print(position.x, position.y)
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			if !walk.playing:
				walk.play()
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			if !walk.playing:
				walk.play()
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			if !walk.playing:
				walk.play()
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			if !walk.playing:
				walk.play()
			anim.play("back_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("back_idle")
	

func player():
	pass
	

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
		
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 10
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
		


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
	
func attack():
	var dir = current_dir
	#attacking BABY
	if Input.is_action_just_pressed("attack") and abs(velocity.length()) <= 1:
		if !swordhit.playing:
			swordhit.play()
		global.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("front_attack")
			$deal_attack_timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$deal_attack_timer.start()
			



func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false
	
func current_camera():
	if global.destination_scene == "world":
		$world_camera.enabled = true
		$cliffside_camera.enabled = false
	elif global.destination_scene == "cliff_side":
		$world_camera.enabled = false
		$cliffside_camera.enabled = true


func update_health():
	var healthbar = $healthbar
	
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

#func health_pickup():
	#if global.health_pickup == true:
		#health = health + 30
		

func _on_regin_timer_timeout():
	if health < 100 and not enemy_inattack_range:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0
		
func menu_scene_change_handler():
	global.finish_changescenes()
	

		
