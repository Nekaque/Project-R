extends Node

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Start, "modulate:a", 0, 1)

func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
