extends Node

@onready var p = $Me
@onready var klara = $Klara
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("switch")):
		klara.controlable = !klara.controlable
		p.controlable = !p.controlable
		
