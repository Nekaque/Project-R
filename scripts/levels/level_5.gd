extends Node

@onready var p = $Me

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Start, "modulate:a", 0, 1)
	p.controlable = false
	p.dir = 1.1
	var timer = get_tree().create_timer(0.6)
	await  timer.timeout
	p.controlable = true

func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
