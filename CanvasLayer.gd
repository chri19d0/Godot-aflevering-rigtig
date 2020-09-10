extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func show_message(text):
	$Message.text = text
	$Message.show()
# Called when the node enters the scene tree for the first time.
func game_over():
	show_message("Game Over")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
