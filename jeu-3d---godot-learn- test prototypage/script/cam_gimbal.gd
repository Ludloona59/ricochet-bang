extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous##ça sa sert à foutre la direction de la cam (gauche droite)

##ça sa sert à foutre la direction de la cam (gauche droite)
func _process(delta):
	if Input.is_action_pressed("cam_rotation_left"):
		rotation.y -= 1.0 * delta
	if Input.is_action_pressed("cam_rotation_right"):
		rotation.y += 1.0 * delta
		
##ça sa sert à faire monter et descendre la cam
	if Input.is_action_pressed("cam_gimball_up"):
		position.y -= 1.0 * delta
		rotation.x -= 0.3 * delta
	if Input.is_action_pressed("cam_gimball_down"):
		position.y += 1.0 * delta
		rotation.x += 0.3 * delta
