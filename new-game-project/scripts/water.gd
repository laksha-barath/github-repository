extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var water_gem_counter = 0

@onready var coin_label = %Label

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("p2_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("p2_left", "p2_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("water_gem"):
		water_gem_counter += 1
		coin_label.text = str(water_gem_counter)
	
		
		
		
		
		#set_coin(water_gem_counter + 1)
		#print(water_gem_counter)
	
# func set_coin(new_coin_count: int) -> void:
	#water_gem_counter = new_coin_count
	#coin_label.text = "water gem Count:" + str(water_gem_counter)



	

	
