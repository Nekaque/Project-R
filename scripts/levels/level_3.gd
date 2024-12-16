extends Node

@onready var p = $Player
@onready var wet = $Player/Wet
@onready var particle = $Splash
var in_water = false
var splash = "res://assets/sounds/splash.wav"

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Start, "modulate:a", 0, 1)

func _on_water_body_entered(body: Node2D) -> void:
	p.slip = true
	p.gravity = 0.1
	p.velocity.y = 50
	p.speed = 100
	particle.position = p.position + Vector2(0,10)
	particle.emitting = true
	GM.play_sound(splash)
	wet.visible = true
	in_water = true


func _on_water_body_exited(body: Node2D) -> void:
	particle.position = p.position  + Vector2(0,24)
	particle.emitting = true
	GM.play_sound(splash)
	p.gravity = 1
	p.speed = 150
	var timer = get_tree().create_timer(2)
	in_water = false
	await  timer.timeout
	if !in_water:
		p.slip = 0
		wet.visible = false
		p.speed = 200


func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
	
