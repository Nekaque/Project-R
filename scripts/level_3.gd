extends Node

@onready var p = $Player

func _process(delta: float) -> void:
	pass

func _on_water_body_entered(body: Node2D) -> void:
	p.slip = 0.1
	p.gravity = 0.1


func _on_water_body_exited(body: Node2D) -> void:
	print("wet")
	p.gravity = 1
	var timer = get_tree().create_timer(2)
	await  timer.timeout
	p.slip = 0
