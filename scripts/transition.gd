extends CanvasLayer

@onready var shown = false
@onready var fade = $ColorRect
const TIME = 0.5
var l1 = "res://scenes/level_1.tscn"
func _ready() -> void:
	fade.color = Color("black",0)

func reset():
	update()
	var timer = get_tree().create_timer(TIME)
	await timer.timeout
	get_tree().change_scene_to_file(l1)
	update()
	
func update():
	if shown:
		var tween = get_tree().create_tween()
		tween.tween_property(fade,"color:a",0,TIME)
		shown = false
	else:
		var tween = get_tree().create_tween()
		tween.tween_property(fade,"color:a",1,TIME)
		shown = true
