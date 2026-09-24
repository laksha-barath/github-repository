extends Area2D

@export var speed = 500
var direction = Vector2.ZERO

func _process(delta):
	position += direction * speed * delta

func _on_area_entered(area):
	var player = area.get_parent()
	if player.is_in_group("players"):
		await get_tree().create_timer(0.1).timeout
		get_tree().reload_current_scene()


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
	
#func _game_over():
	#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
