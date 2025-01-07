extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().paused:
		visible=true
	else:
		visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		visible=false
		get_tree().paused=false
	pass
