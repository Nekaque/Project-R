extends Node


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("trans"): T.next()
