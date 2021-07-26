extends Label



func _ready():
	var globalVars = get_node("/root/GlobalVars")
	set_text("Score: " + str(globalVars.finalScore))
