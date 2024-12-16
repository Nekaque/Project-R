extends Node

@onready var tm = $PlayArea
@onready var p = $Player


func _process(delta: float) -> void:
	var pos = tm.local_to_map(p.position - Vector2(640,328))
	var id = tm.get_cell_tile_data(pos)
	if (id == null): p.slip = false
	elif (id.terrain == 0): p.slip = true
	else: p.slip = false

func _on_end_body_entered(body: Node) -> void:
	GM.next()
