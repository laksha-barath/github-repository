extends Node2D


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_screen.tscn")


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/2level.tscn")


func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level3.tscn")

	
func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()
