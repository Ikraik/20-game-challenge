extends Control

@onready var options=$HBoxContainer/VBoxContainer/GameModeOption
@onready var options_button=$HBoxContainer/VBoxContainer/GameModeOption/OptionButton
@onready var start=$"HBoxContainer/VBoxContainer/Start Button"
@onready var gameselect=$"HBoxContainer/VBoxContainer/Game Selection/GameSelectButton"
# Called when the node enters the scene tree for the first time.   
func _ready() -> void:
	gameselect.grab_focus()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	match index:
		1:
			g_var.g_gamemode=g_var.gamemode.sp
			start.disabled=false
		2:
			g_var.g_gamemode=g_var.gamemode.coop
			start.disabled=false
		_:
			start.disabled=true


func _on_quit_button_pressed() -> void:
	get_tree().quit() # Replace with function body.


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/GameManager.tscn")


func _on_check_button_toggled(toggled_on: bool) -> void:
	g_var.displaycontrols=toggled_on


func _on_game_select_button_item_selected(index: int) -> void:
	match index:
		1: 
			g_var.gamepath="res://scene/PingPong/ping_pong.tscn"
			options_button.disabled=false
			start.disabled=true
		2:
			g_var.gamepath="res://scene/Flappy Bird/flappy_bird.tscn"
			options_button.disabled=true
			start.disabled=false
		_:
			start.disabled=true
			options_button.disabled=true
