extends Node2D

const PLAYER_GROUP: String = "players"
const MAX_GEMS: int = 5
const MAX_PLAYERS: int = 2

var max_gems: int = 5
var time: int = 0 
var players_at_exit: int = 0

@export var time_label : Label
@export var timer : Timer


# Checks if a player has collected 5 gems before counting them at the exit.
func _on_button_body_entered(body: Node2D) -> void:
	if body.is_in_group(PLAYER_GROUP) and body.gem_counter == MAX_GEMS:
		players_at_exit += 1
		if players_at_exit >= MAX_PLAYERS:
			get_tree().change_scene_to_file("res://scenes/level3.tscn")


# Removes the player from the exit count when they leave the exit.
func _on_button_body_exited(body: Node2D) -> void:
	if body.is_in_group(PLAYER_GROUP) and body.gem_counter == MAX_GEMS:
		players_at_exit -= 1


# Opens the Pause Menu and pauses the game.
func _on_pause_button_pressed() -> void:
	get_node("/root/Level2/PauseMenuControl").show()
	get_tree().paused = true


# Opens the Settings Menu and pauses the game.
func _on_button_pressed() -> void:
	get_node("/root/Level2/SettingMenuControl").show()
	get_tree().paused = true


# Increases the timer and updates the time shown on screen.
func _on_timer_timeout() -> void:
	time += 1
	time_label.text = str(time)
