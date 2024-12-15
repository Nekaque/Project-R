extends Node

@onready var p = $Me
@onready var klara = $Klara
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("switch")):
		klara.controlable = !klara.controlable
		p.controlable = !p.controlable
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	p.controlable = false
	
	$Chest/Locked.visible = false
	$Chest/Opened.visible = true
	$Chest.collision_mask = 4
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(klara,"modulate:a", 1, 1)
	tween.tween_property($Chest,"modulate:a", 0, 1)
	var timer = get_tree().create_timer(1)
	await timer.timeout
	$Chest.queue_free()
