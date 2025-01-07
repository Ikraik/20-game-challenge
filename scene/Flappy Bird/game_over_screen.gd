extends CanvasLayer
var lose_sound = load("res://audio/Player Wins!.wav")
signal continued
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue") and visible:
		visible=false
		emit_signal("continued")
		get_tree().paused=false
