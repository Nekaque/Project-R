extends Node

@onready var p = $Me
@onready var klara = $Klara
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("switch")):
		klara.controlable = !klara.controlable
		p.controlable = !p.controlable
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	$Chest/Locked.visible = false
	$Chest/Opened.visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(klara,"modulate:a", 1, 1)
