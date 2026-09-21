extends Node2D

@export var bullet_scene: PackedScene
@export var timer: Timer 

func _ready():
	randomize()
	spawn_bullet()
		

func spawn_bullet():
	timer.wait_time = randf_range(1.0, 2.5)
	
	var bullet = bullet_scene.instantiate()

	var y = randf_range(50, 670)

	if randi() % 2 == 0:
		bullet.position = Vector2(-20, y)
		bullet.direction = Vector2.RIGHT
	else:
		bullet.position = Vector2(1300, y)
		bullet.direction = Vector2.LEFT

	get_parent().add_child(bullet)
