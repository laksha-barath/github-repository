extends Node2D

@export var bullet_scene: PackedScene

func _ready():
	randomize()

	while true:
		await get_tree().create_timer(randf_range(1.0, 2.5)).timeout
		spawn_bullet()

func spawn_bullet():
	var bullet = bullet_scene.instantiate()

	var y = randf_range(50, 670)

	if randi() % 2 == 0:
		# Spawn from the left
		bullet.position = Vector2(-20, y)
		bullet.direction = Vector2.RIGHT
	else:
		# Spawn from the right
		bullet.position = Vector2(1300, y)
		bullet.direction = Vector2.LEFT

	get_parent().add_child(bullet)
