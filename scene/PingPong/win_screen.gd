extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		get_tree().paused=false
		visible=false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
