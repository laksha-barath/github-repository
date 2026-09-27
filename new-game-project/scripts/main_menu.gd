extends Control


# Opens level one when the Play button is pressed.
func _on_play_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/level1.tscn")
	
	
# Opens the Levels Menu when the Levels button is pressed.
func _on_levels_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/levels.tscn")


# Closes the game when the Exit button is pressed.
func _on_exit_button_pressed() -> void:
	get_tree().quit()
