extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if g_var.displaycontrols:
		visible=true
	else:
		visible=false 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if g_var.displaycontrols:
		visible=true
	else:
		visible=false
