extends Node
@onready var p = $Me

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lava_body_entered(body: Node2D) -> void:
	p.velocity.y = 10
	p.gravity = 0.01
	GM.reset()
