extends Label

var player=null

func _ready():
	var globalVars = get_node("/root/GlobalVars")
	player = globalVars.player
	
func _physics_process(delta):
	set_text(str(player.score))
