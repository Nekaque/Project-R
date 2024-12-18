extends CanvasLayer

func _on_button_pressed() -> void:
	GM.reset()
	GM.started = true

func _on_exit_pressed() -> void:
	if !OS.has_feature("web"): get_tree().quit()

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("jump")):
		GM.reset()
		GM.started = true
