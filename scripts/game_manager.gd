extends CanvasLayer

@onready var shown = false
@onready var fade = $ColorRect
const TIME = 0.5
var level = 0
var prefix = "res://scenes/levels/"
var levels = ["level_1.tscn", "level_2.tscn", "level_3.tscn", "level_4.tscn", "level_5.tscn", "end.tscn"]
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
	get_tree().change_scene_to_file(prefix+levels[level])
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
	
