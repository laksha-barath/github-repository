extends HSlider

@export var bus_Music: String = "Music"

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_Music)
	value_changed.connect(_on_value_changed)
	
@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	
