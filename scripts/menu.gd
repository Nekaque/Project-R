extends CanvasLayer

func _on_button_pressed() -> void:
	GM.reset()

func _on_exit_pressed() -> void:
	get_tree().quit()
