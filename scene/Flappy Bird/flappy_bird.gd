extends Node2D

@onready var player=$PlayerBirdy
@onready var StartScreen=$StartScreen
@onready var GameOverScreen=$GameOverScreen
@onready var playerstart_pos=player.position
var win_sound = load("res://audio/Bounce.wav")
var CurrentScore=0
var HighScore=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	StartScreen.visible=true
	GameOverScreen.visible=false
	get_tree().paused=true

func player_reset():
	player.position=playerstart_pos
	player.velocity=Vector2(0,0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$ParallaxBackground/Sky.motion_scale=Vector2(1,1)
	$ParallaxBackground.scroll_base_scale=Vector2(1,1)
	if !get_tree().paused:
		StartScreen.visible=false
	if player.is_on_floor() or player.collision_data:
		if CurrentScore>HighScore:
			HighScore=CurrentScore
		score_changed()
		GameOverScreen.visible=true
		$Scoreboard.visible=false
		get_tree().paused=true
	if $Pipes_Solo.position.x<=0:#((DisplayServer.window_get_size().x/2)-DisplayServer.window_get_size().x):
		$AudioStreamPlayer.stream=win_sound
		$AudioStreamPlayer.play()
		CurrentScore+=1
		score_changed()
		$Pipes_Solo.reset_position()


func score_changed():
	$Scoreboard/CurrentScore.text="Current Score : %d"%CurrentScore
	$GameOverScreen/CurrentScore.text="Current Score : %d"%CurrentScore
	$Scoreboard/HighScore.text="High Score: %d"%HighScore
	$GameOverScreen/HighScore.text="High Score: %d"%HighScore

func _on_game_over_screen_continued() -> void:
	$Scoreboard.visible=true
	CurrentScore=0
	player_reset()
	$Pipes_Solo.reset_position() # Replace with function body.
