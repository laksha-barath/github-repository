extends Control


func _ready() -> void:
	BgMusic.hide()
	BgMusic.get_child(0).stop()

func _play() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/game_screen.tscn")
	
func _levels() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/levels.tscn")


func _exit() -> void:
	get_tree().quit()
