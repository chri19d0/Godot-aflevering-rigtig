extends KinematicBody2D

const UP = Vector2(0, -1)
export(int) var ACCELERATION = 50
const GRAVITY = 20
export(int) var MAX_SPEED = 200
export(int) var JUMP_HEIGHT = 550
var motion = Vector2()
export var max_health = 100
var health = max_health
signal health_changed
signal points_changed
var points = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		friction = true
		$Sprite.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HEIGHT
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play(("Jump"))
		else:
			$Sprite.play(("Fall"))
		if friction:
			motion.x = lerp(motion.x, 0, 0.05)
			
	motion = move_and_slide(motion, UP)

func damage ():
	if health>0:
		health = health - 1
		emit_signal("health_changed", health)
		print(health)
		if health == 0:
			get_node("../GameOverCanvasLayer/AnimationPlayer").play("Game over")
		
func on_body_entered(_body, source):
	source.queue_free()
	points=points+1
	emit_signal("points_changed", points)
	print ("Points: "+str(points))
	
	
	
	
