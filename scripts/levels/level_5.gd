extends Node


#func _ready() -> void:
	#var tween = get_tree().create_tween()
	#tween.tween_property($Start, "modulate:a", 0, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
