extends Node2D


# Opens Level 1 when the Level 1 button is pressed.
func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")


# Opens Level 2 when the Level 2 button is pressed.
func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/2level.tscn")


# Opens Level 3 when the Level 3 button is pressed.
func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level3.tscn")


# Opens Main menu when the Main menu button is pressed.
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
	
# Closes the game when the Quit button is pressed.
func _on_quit_button_pressed() -> void:
	get_tree().quit()
