extends Camera3D

@export var acceleration = 25.0
@export var moveSpeed = 5.0
@export var mouseSpeed = 300

var velocity = Vector3.ZERO
var lookAngles = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	##ça sa sert à savoir jusqu'où la caméra peut regarder en haut et en bas
	lookAngles.y = clamp(lookAngles.y, PI / -2, PI / 2)
	set_rotation(Vector3(lookAngles.y, lookAngles.x, 0))
	var direction = updateDirection()
	if direction.length_squared() > 0:
		velocity += direction * acceleration * delta
	if velocity.length() > 0:
		velocity = velocity.normalized() * moveSpeed
	
	
	translate(velocity * delta)


func _input(event):
	## ça c pour la mouse rotation
	if event is InputEventMouseMotion:
		lookAngles -= event.relative / mouseSpeed

func updateDirection():
	##sa permet de donner la direction dans laquel les inputs tourne la camera
	var dir = Vector3()
	
	
	if Input.is_action_pressed("Move_forward"):
		dir += Vector3.FORWARD
	##	if Input.is_action_pressed("springting"):
		##	position += direction * current_speed * delta
		
		
	if Input.is_action_pressed("Move_backward"):
		dir += Vector3.BACK
		if Input.is_action_pressed("springting"):
			dir += 2*(Vector3.BACK)*(velocity*2)
		
		
	if Input.is_action_pressed("Move_down"):
		dir += Vector3.DOWN
		##if Input.is_action_pressed("springting"):
		##	position += direction * current_speed * delta
			
			
	if Input.is_action_pressed("Move_up"):
		dir += Vector3.UP
	##	if Input.is_action_pressed("springting"):
			##position += direction * current_speed * delta
		
		
	if Input.is_action_pressed("Move_right"):
		dir += Vector3.RIGHT
		##if Input.is_action_pressed("springting"):
		##	position += direction * current_speed * delta
			
		
	if Input.is_action_pressed("Move_left"):
		dir += Vector3.LEFT
	##	if Input.is_action_pressed("springting"):
			##position += direction * current_speed * delta
		
		
	if Input.is_action_pressed("springting"):
		dir  += velocity
	if dir == Vector3.ZERO:
		velocity = Vector3.ZERO
	
	return dir.normalized()
	
	
func _process_camera_turn(delta):
	rotation.y += 1.0*delta
