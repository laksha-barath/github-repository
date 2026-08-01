extends StaticBody2D

var triggered = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if triggered:
		return

	var player = area.get_parent()

	if player.is_in_group("players"):
		triggered = true
		print(player.name, " triggered tile")

		await get_tree().create_timer(1).timeout

		# disappear
		$CollisionShape2D.disabled = true
		$Sprite2D.visible = false

		# wait before respawning
		await get_tree().create_timer(2).timeout

		# respawn
		$CollisionShape2D.disabled = false
		$Sprite2D.visible = true

		triggered = false
