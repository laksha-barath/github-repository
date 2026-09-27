extends AnimatableBody2D

const HALF: float = 2.0

@export var offset: Vector2
@export var duration: float 


# Sets the tile's starting position and makes it move back and forth.
func _ready() -> void:
	var original_position = position
	
	if duration <= 0:
		return
		
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", original_position + offset, duration / HALF)
	tween.tween_property(self, "position", original_position, duration / HALF)


# Runs every frame while the moving tile is active.
func _process(delta: float) -> void:
	pass
