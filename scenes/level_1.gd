extends Node2D

@onready var tm = $PlayArea
@onready var p = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pos = tm.local_to_map(p.position-Vector2(640,328))
	var id = tm.get_cell_source_id(pos)
	print(id)
	if id == 0: p.slip = true
	else: p.slip = false
	print(p.slip)
