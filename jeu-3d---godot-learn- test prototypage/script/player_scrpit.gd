extends CharacterBody3D


# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
# Vertical impulse applied to the character upon jumping in meters per second.
@export var jump_impulse = 20
# Vertical impulse applied to the character upon bouncing over a mob in
# meters per second.
@export var bounce_impulse = 16
# Emitted when the player was hit by a mob.

var target_velocity = Vector3.ZERO


##ça sa sert à garder l'info du mouvement qu'on donne.
func _physic_process(_delta):
	var direction = Vector3.ZERO
	
	#ça c pour les control et les inputs du joueur!!(en-dessous)
	if Input.is_action_pressed("Move_right"):
		direction.rotate.y += 2000
	if Input.is_action_pressed("Move_left"):
		direction.rotate.y -= 2000
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# Setting the basis property will affect the rotation of the node.
		$Pivot.basis = Basis.looking_at(direction)
		
#	if Input.is_action_pressed("Move_Backward"):
#		direction.y += 10
#	if Input.is_action_pressed("Move_Forward"):
#		direction.y -= 10
# Moving the Character
	velocity = target_velocity
	move_and_slide()
