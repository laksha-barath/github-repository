extends Control

func _on_levels_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_button_pressed() -> void:
	get_tree().paused = false
	hide()


func _ready() -> void:
	BgMusic.hide()


func _on_go_back_button_pressed() -> void:
	get_tree().paused = false
	hide()
	
	
