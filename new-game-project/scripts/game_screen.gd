extends Node2D

var time : int = 0 
var players_at_exit: int = 0
var max_players: int = 2

@export var time_label : Label
@export var timer : Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#timer.stop()


func _on_timer_timeout() -> void:
	time += 1
	time_label.text = str(time)


func _door_entered(body: Node2D) -> void:
	players_at_exit +=1 
	if players_at_exit >=max_players:
		get_tree().change_scene_to_file("res://scenes/levels.tscn")


func _door_exited(body: Node2D) -> void:
	players_at_exit -=1 
	
