extends Area2D

func _on_area_entered(area: Area2D) -> void:
	#if area.is_in_group("fire"):
		#queue_free()
	pass

func _ready() -> void:
	BgMusic.hide()
	BgMusic.get_child(0).stop()
