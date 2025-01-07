extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var screen_size=DisplayServer.window_get_size()
@onready var audio_paddle=$PaddleWallAudio
var starting_pos

func _ready():
	starting_pos=position

func paddle_reset():
	position=starting_pos

func _physics_process(_delta: float) -> void:
	var collision_info=move_and_slide()
	if Input.is_action_pressed("movedownP1"):
		position.y+=5
	if Input.is_action_pressed("moveupP1"):
		position.y-=5
	move_and_slide()
	if collision_info:
		if !audio_paddle.playing:
			audio_paddle.play()
