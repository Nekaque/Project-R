extends Node

var l1 = "res://scenes/level_1.tscn"

func reset():
	T.update()
	get_tree().change_scene_to_file(l1)
	T.update()
	
