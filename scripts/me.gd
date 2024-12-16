extends CharacterBody2D

var speed = 200.0
var jump_velocity = -400.0
var slip = false
var gravity = 1
@onready var sprite = $Sprite2D
var controlable = true
var coyote = 0.15
var dir = 0
var ending = false
var walking = false
var falling = false

func play(name):
	$Audio.stream = load(name) as AudioStream
	$Audio.play()

func _physics_process(delta: float) -> void:
	if controlable:
		dir = Input.get_axis("left", "right")
		if is_on_floor():
			coyote = 0.15
		if Input.is_action_just_pressed("jump") and coyote >= 0:
			velocity.y = jump_velocity
			$Jump.stream =  load("res://assets/sounds/hop.wav") as AudioStream
			$Jump.play()
		if dir != 0:
			if !walking and velocity.y == 0:
				walking = true
				play("res://assets/sounds/walking.wav")
			velocity.x = dir * speed
			sprite.animation = "walking"
			if dir > 0: sprite.flip_h = true
			elif dir < 0: sprite.flip_h = false
		if dir == 0 and is_on_floor():
			walking = false
			$Audio.stop()
			sprite.animation = "idle"
			if slip: velocity.x = lerp(velocity.x, 0.0, 0.03)
			else: velocity.x = 0
		if not is_on_floor():
			$Audio.stop()
			coyote -= delta
			velocity += get_gravity() * delta * gravity
			velocity.x = dir*speed
			sprite.animation = "jump"
	else:
		if dir != 0:
			sprite.animation = "ending"
			velocity.x = dir*speed
		else:
			sprite.animation = "idle"
			velocity.x = 0
		if not is_on_floor() and not ending:
			velocity += get_gravity() * delta * gravity
			sprite.animation = "jump"
		
	move_and_slide()


func _on_audio_finished() -> void:
	$Audio.play()
