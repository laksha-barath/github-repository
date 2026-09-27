extends StaticBody2D

const TILE_WAIT_TIME: float = 3.0
const PLAYER_GROUP: String = "players"

var triggered : bool = false


# Checks if the tile has already been triggered to prevent the code from running again.
func _on_area_2d_area_entered(area: Area2D) -> void:
	if triggered:
		return

	var player = area.get_parent()

	# Checks that the object is a player, and waits 2 seconds before the tile disappears.
	if player.is_in_group(PLAYER_GROUP):
		triggered = true
		await get_tree().create_timer(TILE_WAIT_TIME).timeout

		# Makes the tile disappear by removing its collision and hiding its sprite.
		$DisappearingTileCollisionShape2D.disabled = true
		$DisappearingTileSprite2D.visible = false

		# Waits 2 seconds before respawning the tile.
		await get_tree().create_timer(2).timeout

		# Makes the tile visible and walkable again.
		$DisappearingTileCollisionShape2D.disabled = false
		$DisappearingTileSprite2D.visible = true

		triggered = false
