extends MarginContainer

func _ready():
	$Points_label.text=("Points: "+str(0))

func _on_Player_points_changed(points):
	$Points_label.text=("Points: "+str(points))
