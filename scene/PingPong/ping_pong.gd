extends Node2D

@onready var ball=$Ball
@onready var p1=$Scoreboard/PlayerLabel1
@onready var p2=$Scoreboard/PlayerLabel2
@onready var goalp1=$Scoreboard/P1_Score
@onready var goalp2=$Scoreboard/P2_Score
@onready var winnerlabel=$"WinScreen/Panel/Player Wins Label"
@onready var audio_winner=$WinScreen/AudioWinner
var counter1=0
var counter2=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func player_score(player:int):
	match player:
		1:
			counter1+=1
			goalp1.text="Player Score:\n %d"%counter1
			alertscreen_playerwin(1)
		2:
			counter2+=1
			goalp2.text="Player Score:\n %d"%counter2
			alertscreen_playerwin(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass   

func alertscreen_playerwin(player:int):
	match player:
		1:
			winnerlabel.text="%s Wins!"%p1.text
			ball.ball_reset(1)
		2:
			winnerlabel.text="%s Wins!"%p2.text
			ball.ball_reset(2)
	$WinScreen.visible=true
	audio_winner.play()
	$Player1.paddle_reset()
	$Player2.paddle_reset()
	get_tree().paused=true


func _on_goal_4p_2_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body.name == ball.name:
		player_score(2)


func _on_goal_4p_1_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body.name == ball.name:
		player_score(1)


func _on_win_screen_restart_timer() -> void:
	pass # Replace with function body.
