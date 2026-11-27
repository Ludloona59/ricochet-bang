extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous##ça sa sert à foutre la direction de la cam (gauche droite)

##ça sa sert à foutre la direction de la cam (gauche droite)
func _process(delta):
	if Input.is_action_pressed("cam_rotation_left"):
		rotation.y -= 2.0 * delta
	if Input.is_action_pressed("cam_rotation_right"):
		rotation.y += 2.0 * delta
		
##ça sa sert à faire monter et descendre la cam
	#if Input.is_action_pressed("cam_gimball_up"):
	#	position.y -= 1.0 * delta
	#	rotation.x -= 0.3 * delta
	#if Input.is_action_pressed("cam_gimball_down"):
	#	position.y += 1.0 * delta
	#	rotation.x += 0.3 * delta
		
		##ça sa permet de faire monter descendre la cam
		##et éviter qu'elle rotate comme elle faisait de base
	if Input.is_action_pressed("camera_up"):
		position.y += 5.0 * delta
		position.y += 5.0 * delta
	if Input.is_action_pressed("camera_down"):
		position.y -= 5.0 * delta
		position.y -= 5.0 * delta
		

		
		
		##ça c un test pour qu'on puisse zoom/dezoom
	##if Input.is_action_pressed("left_click_hold"):
		##Vector3() = position. z * delta
		
	if Input.is_action_pressed("left_click_hold"):
		position.z -= 1.0 * delta 
		position.z -= 1.0 * delta
	if Input.is_action_pressed("left_click_hold"):
		position.z += 1.0 * delta 
		position.z += 1.0 * delta
		
#func _input(event):
	
	#if event is InputEventMouseButton:
		#if Input.is_action_pressed("BUTTON_WHEEL_UP"):
		#	position.z -= 1.0 * delta 
		#	position.z -= 1.0 * delta
		
		#if Input.is_action_pressed("BUTTON_WHEEL_DOWN"):
		#	position.z += 1.0 * delta 
		#	position.z += 1.0 * delta
