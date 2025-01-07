extends CharacterBody2D

const SPEED = -300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	position.x=DisplayServer.screen_get_size().x+50
	randheight()
	pass

func reset_position():
	position.x=DisplayServer.screen_get_size().x+50
	randheight()
	velocity=Vector2(SPEED,0) 

func randheight():
	position.y=float(randf_range(100,DisplayServer.screen_get_size().y/2))

func _physics_process(_delta: float) -> void:
	velocity.x = -300
	move_and_slide()
