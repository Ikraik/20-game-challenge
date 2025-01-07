extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var screen_size=DisplayServer.window_get_size()
@onready var audio_paddle=$PaddleWallAudio
var starting_pos:Vector2

func _ready():
	starting_pos=position

func paddle_reset():
	position=starting_pos

func _physics_process(_delta: float) -> void:
	var collision_info=move_and_slide()
	match g_var.g_gamemode:
		1:
			if global_position.y>g_var.ball_position.y:
				position.y-=2
			elif global_position.y<g_var.ball_position.y:
				position.y+=2
		2:
			if Input.is_action_pressed("movedownP2"):
				position.y+=5
			if Input.is_action_pressed("moveupP2"):
				position.y-=5
	move_and_slide()
	if collision_info:
		if !audio_paddle.playing:
			audio_paddle.play()
