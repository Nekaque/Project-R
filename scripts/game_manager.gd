extends CanvasLayer

@onready var shown = false
@onready var fade = $ColorRect
const TIME = 0.5
var level = 0
var levels = ["res://scenes/level_1.tscn", "res://scenes//level_2.tscn", "res://scenes//level_3.tscn", "res://scenes//level_4.tscn", "res://scenes//level_5.tscn", "res://scenes//end.tscn"]
@onready var sfx = $SFX
@onready var music = $Music


func _ready() -> void:
	fade.color = Color("black",0)
	sfx.volume_db = -20
	music.volume_db = -80
	play_music("res://assets/sounds/mybrother.ogg")

func reset():
	update()
	var timer = get_tree().create_timer(TIME)
	await timer.timeout
	get_tree().change_scene_to_file(levels[level])
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

func next():
	level+=1
	reset()
	
func play_sound(name):
	sfx.stream = load(name) as AudioStream
	sfx.play()

func play_music(name):
	music.stream = load(name) as AudioStream
	music.play()
	
