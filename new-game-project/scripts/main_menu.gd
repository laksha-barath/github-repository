extends Control


func _ready() -> void:
	BgMusic.hide()
	BgMusic.get_child(0).stop()

	
func _on_play_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/game_screen.tscn")
	

func _on_levels_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/levels.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
