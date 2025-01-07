extends Node2D

@onready var pausemenu=$CanvasLayer/PausedMenu

var gamescene=load(g_var.gamepath)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var gameinstance=gamescene.instantiate()
	add_child(gameinstance)
	pausemenu.visible=false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if pausemenu.visible:
		pausemenu.visible=!pausemenu.visible

func pause_game(): #Pausing the Game here
	pausemenu.visible = true
	pausemenu.resume_button.grab_focus()
	get_tree().paused = true
# Replace with function body.
