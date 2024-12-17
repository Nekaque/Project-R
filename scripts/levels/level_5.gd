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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
