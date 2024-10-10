extends CharacterBody2D

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_body_entered(body):
	entered = true
	


func _on_area_2d_body_exited(body):
	pass # Replace with function body.

func increase_health():
	if entered == true:
		global.health_pickup = true
		entered = false
	
