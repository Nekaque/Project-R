extends Node
@onready var p = $Me
var lava = "res://assets/sounds/lava.wav"
@onready var particle = $Splash

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Start, "modulate:a", 0, 1)


func _on_lava_body_entered(body: Node2D) -> void:
	particle.position = p.position  + Vector2(0,20)
	particle.emitting = true
	p.velocity.y = 40
	p.gravity = 0.01
	p.speed = 0
	p.death()
	GM.play_sound(lava)
	GM.reset()


func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
