extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	var msg = connect("body_entered", get_node("../Player"), "on_body_entered",[self])
	if msg != OK:	
		print("Failed to connect signal")
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
