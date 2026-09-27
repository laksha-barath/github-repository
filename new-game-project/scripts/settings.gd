extends Control


# Opens the Levels menu 
func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels.tscn")
	
	
# Quits the game when the Quit button is pressed.
func _on_quit_pressed() -> void:
	get_tree().quit()
	

# Hides the background music when the scene starts.
func _ready() -> void:
	BgMusic.hide()


# Unpauses the game and hides the settings menu and returns to the game.
func _on_go_back_button_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
