extends Control


func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_levels_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels.tscn")


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_resume_requested() -> void:
	pass # Replace with function body.
