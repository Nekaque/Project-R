extends Node

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Start, "modulate:a", 0, 1)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("trans"): T.next()


func _on_end_body_entered(body: Node2D) -> void:
	print(body.name)
	T.next()
