extends CharacterBody2D

var speed = 200.0
const JUMP_VELOCITY = -400.0
var slip = false
var gravity = 1
@onready var sprite = $Sprite2D
var controlable = true
var coyote = 0.1
var dir = 0

func _physics_process(delta: float) -> void:
	if controlable:
		dir = Input.get_axis("left", "right")
		if is_on_floor():
			coyote = 0.1
		if Input.is_action_just_pressed("jump") and coyote >= 0:
			velocity.y = JUMP_VELOCITY
		if dir != 0:
			velocity.x = dir * speed
			sprite.animation = "walking"
			if dir > 0: sprite.flip_h = true
			elif dir < 0: sprite.flip_h = false
		else:
			sprite.animation = "idle"
			if slip: velocity.x = lerp(velocity.x, 0.0, 0.03)
			else: velocity.x = 0
		if not is_on_floor():
			coyote -= delta
			velocity += get_gravity() * delta * gravity
			sprite.animation = "jump"
	else:
		if dir != 0:
			sprite.animation = "walking"
			velocity.x = dir*speed
		else:
			sprite.animation = "idle"
			velocity.x = 0
		if not is_on_floor():
			velocity += get_gravity() * delta * gravity
			sprite.animation = "jump"
		
	move_and_slide()
