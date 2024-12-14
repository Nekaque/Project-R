extends Node

@onready var p = $Player
@onready var wet = $Player/Camera2D/Wet

func _process(delta: float) -> void:
	pass

func _on_water_body_entered(body: Node2D) -> void:
	print("splash")
	p.slip = 0.1
	p.gravity = 0.01


func _on_water_body_exited(body: Node2D) -> void:
	print("wet")
	wet.visible = true
	p.gravity = 1
	var timer = get_tree().create_timer(2)
	await  timer.timeout
	p.slip = 0
	wet.visible = false
