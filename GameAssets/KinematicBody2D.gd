extends KinematicBody2D

var player = null
var globalVars=null

var velocity = Vector2()

func _ready():
	globalVars = get_node("/root/GlobalVars")
	player = globalVars.player
	velocity = position.direction_to(player.position) * rand_range(1.2,2.5)
	
	


func _physics_process(delta):
	
		
	var collision = move_and_collide(velocity)
	if collision:
		var enemyData = get_node("Sprite").texture.get_data()
		enemyData.lock()
		var enemyColor = enemyData.get_pixel(10,10)
				
		#get color of spinner	
		var image = get_viewport().get_texture().get_data()
		image.flip_y()
		image.lock()
		var spinnerColor = null
		image.save_png("c:/Users/prana/screenshot.png")
		
	
		var dist = position - player.position
		var line = player.position + dist/2
		spinnerColor = image.get_pixel(line.x, line.y)
		
		if(abs(spinnerColor.r - enemyColor.r) <= 0.01 and abs(spinnerColor.g - enemyColor.g) <= 0.01 
			and abs(spinnerColor.b - enemyColor.b) <= 0.01):
			player.score+=1
			self.queue_free()
		
		else:
			self.queue_free()
			globalVars.finalScore = globalVars.player.score
			var file = File.new()
			file.open("PlayerData.tres", File.READ_WRITE)
			var content = file.get_as_text()
			if(int(content) < globalVars.finalScore):
				file.store_string(str(globalVars.finalScore))
			globalVars.highScore = int(file.get_as_text())
			file.close()
			get_tree().change_scene("res://GameOver.tscn")	
		
		
		
		
		
		

		
