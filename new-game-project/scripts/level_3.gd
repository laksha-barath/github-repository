extends Node2D

const MAX_GEMS: int = 5
const MAX_PLAYERS: int = 2
const PLAYER_GROUP: String = "players"

var time: int = 0 
var players_at_exit: int = 0

@export var timer : Timer
@onready var time_label: Label = $Timer/TimerLabel


# Increases the timer and updates the time shown on screen.
func _on_timer_timeout() -> void:
	time += 1
	time_label.text = str(time)


# Opens the Pause Menu and pauses the game.
func _on_pause_button_pressed() -> void:
	get_node("/root/Level3/PauseMenuControl").show()
	get_tree().paused = true


# Checks if a player has collected 5 gems before counting them at the exit.
func _on_door_body_entered(body: Node2D) -> void:
	if body.is_in_group("PLAYER_GROUP") and body.gem_counter >= MAX_GEMS:
		players_at_exit += 1 
		if players_at_exit >= MAX_PLAYERS:
			get_tree().quit()


# Removes the player from the exit count when they leave the door.
func _door_exited(body: Node2D) -> void:
	if body.is_in_group("PLAYER_GROUP") and body.gem_counter >= MAX_GEMS:
		players_at_exit -= 1 


# Opens the Settings menu and pauses the game.
func _on_button_pressed() -> void:
	get_node("/root/Level3/SettingsMenuCounter").show()
	get_tree().paused = true
