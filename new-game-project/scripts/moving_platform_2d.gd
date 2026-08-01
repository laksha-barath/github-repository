extends AnimatableBody2D

@export var offset: Vector2
@export var duration: float 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var original_position = position
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", original_position + offset, duration / 2)
	tween.tween_property(self, "position", original_position, duration / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
