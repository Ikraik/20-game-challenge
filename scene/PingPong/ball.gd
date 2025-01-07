extends CharacterBody2D

var collision_data
var position_reset
var screen_size=DisplayServer.window_get_size()
@onready var bounce=$BounceSound
var bounce_main=preload("res://audio/Bounce.wav")
var bounce_player=preload("res://audio/Bounce_paddle.wav")

func _ready():
	velocity = Vector2(300,50)
	position.x=screen_size.x/2
	position.y=screen_size.y/2
	position_reset=position

func _physics_process(delta):
	collision_data = move_and_collide(velocity * delta)
	if collision_data:
		if !bounce.playing:
			if collision_data.get_collider().name=="Player1" || collision_data.get_collider().name=="Player2":
				bounce.stream=bounce_player
				bounce.volume_db=-1
			else:
				bounce.stream=bounce_main
				bounce.volume_db=0
			bounce.play()
		velocity.y += randf_range(-20, 20) #rand_range(-20, 20) for Godot 3
		velocity = velocity.bounce(collision_data.get_normal())

func _process(_delta: float) -> void:
	g_var.ball_position=position
	
func ball_reset(victory: int):
	position=position_reset
	match victory:
		1:
			velocity = Vector2(300,50)
		_:
			velocity = Vector2(-300,50)
