extends Label


func _ready():
	var globalVars = get_node("/root/GlobalVars")
	set_text("High Score: " + str(globalVars.highScore))
