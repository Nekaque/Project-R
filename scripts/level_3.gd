extends Node

@onready var p = $Player
@onready var wet = $Player/Wet
@onready var splash = $Splash
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Start, "modulate:a", 0, 1)

func _on_water_body_entered(body: Node2D) -> void:
	p.slip = 0.1
	p.gravity = 0.1
	p.velocity.y = 50
	splash.position = p.position + Vector2(0,20)
	splash.emitting = true
	print("wet")
	wet.visible = true


func _on_water_body_exited(body: Node2D) -> void:
	print("out")
	splash.position = p.position  + Vector2(0,24)
	splash.emitting = true
	p.gravity = 1
	var timer = get_tree().create_timer(2)
	await  timer.timeout
	p.slip = 0
	wet.visible = false
