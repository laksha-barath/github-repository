extends Area2D

var direction = Vector2.ZERO

@export var speed = 500


# Moves the bullet in its set direction using its speed.
func _process(delta):
	position += direction * speed * delta


# Checks if the bullet hits a player and reloads the level after 0.1s.
func _on_area_entered(area):
	var player = area.get_parent()
	
	# Checks if the object hit by the bullet is a player.
	if player.is_in_group("players"):
		await get_tree().create_timer(0.1).timeout
		get_tree().reload_current_scene()


# Removes the bullet when it leaves the visible game area.
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
