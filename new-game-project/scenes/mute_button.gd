extends TextureButton

var music_bus = AudioServer.get_bus_index("Music")


func _on_pressed() -> void:
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))

func _ready() -> void:
	BgMusic.hide()
	BgMusic.get_child(0).stop()
