extends Node

@onready var p = $Me
@onready var klara = $Klara
@onready var lab = $Label
var dialog = 0
var dialogues = ["amogus", "skibidi", "Rise of the Rizzlers 4: The revenge of Ohio"]
var current_letter = 0
var stopped = false
var elapsed = 0
const TIME = 1

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("jump") and stopped):
		dialog +=1
		elapsed = 0.1
		current_letter = 0
		if (dialog >= len(dialogues)):
			lab.visible = false
			stopped = false
			klara.dir = 0.5
			p.dir = 0.75
			$Klara/Sprite2D.flip_h = true
			var timer = get_tree().create_timer(0.8)
			var tween = get_tree().create_tween()
			tween.set_parallel(true)
			tween.tween_property($Bad,"modulate:a",1,TIME)
			tween.tween_property($Good,"modulate:a",1,TIME)
			tween.tween_property($ColorRect,"modulate:a", 0, TIME)
			tween.tween_property(lab,"modulate:a", 0, TIME)
			tween.tween_property($Space,"modulate:a",0,TIME)
			await timer.timeout
			klara.dir = 0
			klara.controlable = true
		
func _process(delta: float) -> void:
	if (stopped):
		var text = dialogues[dialog]
		if (current_letter <= len(text) and elapsed >= 0.03):
			lab.text = text.substr(0,current_letter)
			current_letter+=1
			elapsed = 0
		else: elapsed+=delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Klara/Camera2D.visible = true
	$Me/Camera2D.queue_free()
	p.controlable = false
	p.dir = 0
	$Chest/Locked.visible = false
	$Chest/Opened.visible = true
	GM.play_sound("res://assets/sounds/chest.wav")
	p.position = Vector2(368,360)
	var tween = get_tree().create_tween()
	tween.set_parallel()
	tween.tween_property(klara,"modulate:a", 1, TIME)
	tween.tween_property($Chest,"modulate:a", 0, TIME)
	tween.tween_property($ColorRect,"modulate:a", 1, TIME)
	tween.tween_property(lab,"modulate:a", 1, TIME)
	tween.tween_property($Space,"modulate:a",1,TIME)
	var timer = get_tree().create_timer(TIME)
	await timer.timeout
	$Chest.queue_free()
	lab.text = ""
	lab.visible = true
	stopped = true


func _on_bad_body_entered(body: Node2D) -> void:
	if (body.name != "Me"): GM.bad_ending()


func _on_good_body_entered(body: Node2D) -> void:
	if (body.name == "Me"):
		var timer = get_tree().create_timer(0.5)
		await timer.timeout
		body.queue_free()
	else: GM.good_ending()
