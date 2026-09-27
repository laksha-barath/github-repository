extends Area2D


# Checks if the Fire player enters the Fire Gem and removes the gem.
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("fire"):
		queue_free()
