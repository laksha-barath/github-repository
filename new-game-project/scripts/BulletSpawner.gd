extends Node2D

const LEFT_BULLET_POSITION: float = 100.0
const RIGHT_BULLET_POSITION: float = 1300.0
const MIN_BULLET_TIME: float = 1.0
const MAX_BULLET_TIME: float = 3.0
const MIN_BULLET_HEIGHT: float = 50.0
const MAX_BULLET_HEIGHT: float = 670.0

@export var bullet_scene: PackedScene
@export var timer: Timer 


# Randomises the bullet timing and creates the first bullet.
func _ready():
	randomize()
	spawn_bullet()
		

func spawn_bullet():
	# Sets a random time between 1 and 3 seconds before the next bullet.
	timer.wait_time = randf_range(MIN_BULLET_TIME, MAX_BULLET_TIME)
	
	# Creates a new bullet using the bullet scene.
	var bullet = bullet_scene.instantiate()

	 # Chooses a random height for the bullet to appear at.
	var bullet_height = randf_range(MIN_BULLET_HEIGHT, MAX_BULLET_HEIGHT)


	# Randomly chooses whether the bullet starts on the left or right.
	if randi() % 2 == 0:
		bullet.position = Vector2(LEFT_BULLET_POSITION, bullet_height)
		bullet.direction = Vector2.RIGHT
	else:
		# Spawns the bullet on the right and sends it to the left.
		bullet.position = Vector2(RIGHT_BULLET_POSITION, bullet_height)
		bullet.direction = Vector2.LEFT
		
		
	# Adds the bullet to the game so it appears and can move.
	get_parent().add_child(bullet)
