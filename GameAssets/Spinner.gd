extends KinematicBody2D


var rotateBy = 0
var score = 0

func _ready():
	var globalVars = get_node("/root/GlobalVars")
	globalVars.player = self

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		rotateBy = 2
		
	elif Input.is_action_pressed("left"):
		rotateBy = -2		

	set_rotation_degrees(get_rotation_degrees()+rotateBy)
	rotateBy = lerp(rotateBy, 0, 0.05)
