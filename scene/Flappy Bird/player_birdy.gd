extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var collision_data


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump"): 
		velocity.y = JUMP_VELOCITY
	collision_data=move_and_slide()
