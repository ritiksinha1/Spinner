extends Node2D

var player = null
var finalScore = 0
var numSpawned = 0
var highScore

const enemy = preload("res://Enemy.tscn")
const blueEnemy = preload("res://Assets/PixelBlueCircle.png")
const pinkEnemy = preload("res://Assets/PixelPinkCircle.png")
const yellowEnemy = preload("res://Assets/PixelYellowCircle.png")
const greenEnemy = preload("res://Assets/PixelGreenCircle.png")


func _ready():
	randomize()

func _on_Timer_timeout():
	var enemyInstance = enemy.instance()
	var x = 0
	var y = 0
	var rand = rand_range(0,4)
	
	if rand<=1:
		x = -10
		y = rand_range(0,600)
		
		
	elif rand <=2:
		y = -10
		x = rand_range(0,1024)
		
	elif rand<=3:
		x = 1034
		y = rand_range(0,600)
	
	else:
		y = 610
		x = rand_range(0,600)
	
	
	var colorEnemySprite = null
	rand = rand_range(0,4)
	if rand<=1:
		colorEnemySprite = blueEnemy
	elif rand<=2:
		colorEnemySprite = greenEnemy
	elif rand<=3:
		colorEnemySprite = yellowEnemy
	else:
		colorEnemySprite = pinkEnemy
	
	enemyInstance.get_node("Sprite").set_texture(colorEnemySprite)
	enemyInstance.set_position(Vector2(x,y))
	self.add_child(enemyInstance)
	numSpawned+=1
	if numSpawned%5 == 0:
		get_node("Timer").set_wait_time(get_node("Timer").get_wait_time() * 0.9)
		print(get_node("Timer").get_wait_time())
