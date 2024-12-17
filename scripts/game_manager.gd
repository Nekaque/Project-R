extends CanvasLayer

@onready var shown = false
@onready var fade = $ColorRect
const TIME = 0.5
var level = 0
var prefix = "res://scenes/Levels/"
var levels = ["level_1.tscn", "level_2.tscn", "level_3.tscn", "level_4.tscn", "level_5.tscn", "end.tscn"]
@onready var sfx = $SFX
@onready var music = $Music
var another = true


func _ready() -> void:
	fade.color = Color("black",0)
	sfx.volume_db = -10
	music.volume_db = -10
	play_music("res://assets/sounds/XRE.ogg")

func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("trans")): next()
	if (event.is_action_pressed("reset")): reset()

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

func bad_ending():
	update()
	var timer = get_tree().create_timer(TIME)
	await timer.timeout
	get_tree().change_scene_to_file("res://scenes/bad_ending.tscn")
	play_music("res://assets/sounds/bad.ogg")
	update()
	
func good_ending():
	update()
	var timer = get_tree().create_timer(TIME)
	await timer.timeout
	get_tree().change_scene_to_file("res://scenes/good_ending.tscn")
	play_music("res://assets/sounds/good.ogg")
	update()

func next():
	if (another):
		another = false
		level+=1
		reset()
	var timer = get_tree().create_timer(TIME)
	await timer.timeout
	another = true
	
func play_sound(name):
	sfx.stream = load(name) as AudioStream
	sfx.play()

func play_music(name):
	music.stream = load(name) as AudioStream
	music.play()


func _on_music_finished() -> void:
	music.play()
