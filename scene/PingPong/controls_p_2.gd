extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if g_var.g_gamemode==2:
		if g_var.displaycontrols==true:
			visible=true
		else:
			visible=false
	else:
		pass
