extends CharacterBody2D


var speed = 200.0
const JUMP_VELOCITY = -400.0
var slip = false
var gravity = 1
@onready var sprite = $Sprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction > 0: sprite.flip_h = true
	elif direction < 0: sprite.flip_h = false
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if direction != 0:
		velocity.x = direction * speed
		sprite.animation = "walking"
	else:
		sprite.animation = "idle"
		if slip: velocity.x = lerp(velocity.x, 0.0, 0.03)
		else: velocity.x = 0
	if not is_on_floor():
		velocity += get_gravity() * delta * gravity
		sprite.animation = "jump"
	move_and_slide()
