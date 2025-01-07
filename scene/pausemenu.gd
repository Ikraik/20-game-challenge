extends Control

@onready var audio_button = $ButtonPressAudio
@onready var audio_focusbutton = $ButtonFocusAudio
@onready var resume_button=$"PanelContainer/HBoxContainer/VBoxContainer/Resume Button"
var gamemode_value = g_var.g_gamemode
var initial_text
var initial_tooltip
var regex=RegEx.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume_button.grab_focus()
	initial_text=resume_button.text
	initial_tooltip=resume_button.tooltip_text
	regex.compile("ping_pong")
	if regex.search(g_var.gamepath):
		$PanelContainer/HBoxContainer/VBoxContainer/GameModeOption/GameModeButton.disabled=false
	else:
		$PanelContainer/HBoxContainer/VBoxContainer/GameModeOption/GameModeButton.disabled=true
	pass # Replace with function body

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_viewport().set_input_as_handled()
		if get_tree().paused:
			get_tree().paused=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	audio_focusbutton.play()
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1280,720))
		1:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		_:
			pass


func _on_resume_button_pressed() -> void:
	if gamemode_value!=g_var.g_gamemode:
		audio_button.play()
		get_tree().change_scene_to_file("res://scene/GameManager.tscn")
	else:
		get_viewport().set_input_as_handled()
		audio_button.play()
		if get_tree().paused:
			get_tree().paused=false
	


func _on_quit_button_pressed() -> void:
	audio_button.play()
	get_viewport().set_input_as_handled()
	get_tree().quit()


func _on_check_button_toggled(toggled_on: bool) -> void:
	g_var.displaycontrols=toggled_on

func change_resumebutton():
	if gamemode_value!=g_var.g_gamemode:
		resume_button.text="Restart Game"
		resume_button.tooltip_text="Game will be restarted due to changed game mode"
	else:
		resume_button.text=initial_text
		resume_button.tooltip_text=initial_tooltip

func _on_game_mode_button_item_selected(index: int) -> void:
	var regex=RegEx.new()
	regex.compile("ping_pong")
	match index:
		1:
			g_var.g_gamemode=g_var.gamemode.sp
			change_resumebutton()
		2:
			g_var.g_gamemode=g_var.gamemode.coop
			change_resumebutton()
		_:
			pass


func _on_game_select_return_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scene/mainmenu.tscn")
