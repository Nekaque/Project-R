extends Node
@onready var p = $Me
var lava = "res://assets/sounds/lava.wav"
@onready var particle = $Splash
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lava_body_entered(body: Node2D) -> void:
	particle.position = p.position  + Vector2(0,20)
	particle.emitting = true
	p.velocity.y = 40
	p.gravity = 0.01
	p.speed = 0
	GM.play_sound(lava)
	GM.reset()


func _on_end_body_entered(body: Node2D) -> void:
	GM.next()
