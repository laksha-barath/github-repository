extends Node2D

var time : int = 0 
var players_at_exit: int = 0
var max_players: int = 2

@onready var time_label: Label = $Timer/label4
@export var timer : Timer


func _ready() -> void:
	pass
	#timer.stop()


func _on_timer_timeout() -> void:
	time += 1
	time_label.text = str(time)


func _on_pause_button_pressed() -> void:
	get_node("/root/Node2D/Control").show()
	get_tree().paused = true


func _on_door_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		players_at_exit += 1 
		if players_at_exit >= max_players:
			get_tree().change_scene_to_file("res://scenes/levels.tscn")


func _on_door_body_exited(body: Node2D) -> void:
	players_at_exit -=1 
