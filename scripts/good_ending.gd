extends Node

@onready var p = $Me
@onready var klara = $Klara
#@onready var cam = $Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Klara/Sprite2D.flip_h = true
	p.gravity = 1
	p.controlable = false
	p.dir = 1
	klara.dir = 1
	var timer = get_tree().create_timer(0.5)
	await timer.timeout
	p.ending = true
	klara.ending = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#cam.position.x += 200*delta
	pass
