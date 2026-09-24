extends Node2D

var max_gems : int = 5
var time : int = 0 
var players_at_exit: int = 0
var max_players: int = 2



@export var time_label : Label
@export var timer : Timer



func _ready() -> void:
	BgMusic.get_child(0).play()


func _on_timer_timeout() -> void:
	time += 1
	time_label.text = str(time)


func _door_entered(body: Node2D) -> void:
	if body.gem_counter == max_gems:
		players_at_exit += 1 
		if players_at_exit >= max_players:
			await get_tree().create_timer(0.2).timeout
			get_tree().change_scene_to_file("res://scenes/2level.tscn")


func _door_exited(body: Node2D) -> void:
	if body.gem_counter == max_gems:
		players_at_exit -= 1 
		
	
func _on_pause_button_pressed() -> void:
	get_node("/root/Node2D/Control").show()
	get_tree().paused = true


func _on_button_2_pressed() -> void:
	get_node("/root/Node2D/Control2").show()
	get_tree().paused = true
	
