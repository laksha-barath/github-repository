extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DEATH_DELAY: float = 0.1

const FIRE_GEM_GROUP: String = "fire_gem"
const COMMON_DAMAGER_GROUP: String = "CommonDamager"
const WATER_DAMAGER_GROUP: String = "water_damager"

var gem_counter = 0

@export var timer: Timer
@onready var Pick_Up_Sound: AudioStreamPlayer2D = $PickUpSound
@onready var coin_label = %FireGemLabel

# Handles the Fire player's gravity, jumping, and movement.
func _physics_process(delta: float) -> void:
	# Adds gravity when the player is not on the floor.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Makes the player jump when the jump key is pressed.
	if Input.is_action_just_pressed("p1_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("p1_left", "p1_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		# Stops the player when no movement key is pressed.
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _ready() -> void:
	# Goes through each Fire Gem and makes sure it is visible.
	for fire_gem in get_tree().get_nodes_in_group(FIRE_GEM_GROUP):
		fire_gem.show()
		
		
# Runs the code when the Fire player enters an area.
func _on_area_2d_area_entered(area: Area2D) -> void:
	# Checks for a Fire Gem, adds a point, plays the pickup sound, removes the gem, and updates the counter on screen.
	if area.is_in_group(FIRE_GEM_GROUP):
		gem_counter += 1
		Pick_Up_Sound.play()
		area.queue_free()
		coin_label.text = str(gem_counter) 


	# Checks if the player enters a common or Fire damager, then waits for 0.1s and reloads the scene.
	if area.is_in_group(COMMON_DAMAGER_GROUP) or area.is_in_group(WATER_DAMAGER_GROUP):
		await get_tree().create_timer(DEATH_DELAY).timeout
		get_tree().reload_current_scene()


# Reloads the current scene after the player dies.
func die():
	await get_tree().create_timer(DEATH_DELAY).timeout
	get_tree().reload_current_scene()
