extends Node2D

@onready var tm = $PlayArea
@onready var p = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#T.update("res://scenes/level_1.tscn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pos = tm.local_to_map(p.position-Vector2(640,328))
	var id = tm.get_cell_tile_data(pos)
	if (id == null): p.slip = false
	elif (id.terrain == 0): p.slip = true
	else: p.slip = false

func _on_end_body_entered(body: Node) -> void:
	T.reset()
