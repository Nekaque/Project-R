extends Node

@onready var p = $Me
@onready var klara = $Klara
@onready var lab = $Label
var dialog = 0
var dialogues = ["amogus", "skibidi", "Jakub Rollo je mega frajer"]
var current_letter = 0
var stopped = false
var elapsed = 0

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("jump") and stopped):
		dialog +=1
		elapsed = 0.1
		current_letter = 0
		
func _process(delta: float) -> void:
	if (stopped):
		var text = dialogues[dialog]
		if (current_letter <= len(text) and elapsed >= 0.1):
			lab.text = text.substr(0,current_letter)
			current_letter+=1
			elapsed = 0
		else: elapsed+=delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	p.controlable = false
	p.dir = 0
	$Chest/Locked.visible = false
	$Chest/Opened.visible = true
	p.position = Vector2(368,360)
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(klara,"modulate:a", 1, 1)
	tween.tween_property($Chest,"modulate:a", 0, 1)
	var timer = get_tree().create_timer(1)
	await timer.timeout
	$Chest.queue_free()
	lab.text = ""
	lab.visible = true
	stopped = true
