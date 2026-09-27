extends Control


# Unpauses the game and closes the Pause Menu to return to the game.
func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()


# Unpauses the game and opens the Levels Menu.
func _on_levels_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels.tscn")


# Quits the game when the Quit button is pressed.
func _on_quit_pressed() -> void:
	get_tree().quit()
