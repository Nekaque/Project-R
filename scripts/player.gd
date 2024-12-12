extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var slip = false


func _physics_process(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta
	elif Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction: velocity.x = direction * SPEED
	elif slip: velocity.x = lerp(velocity.x, 0.0, 0.1)
	else: velocity.x = 0
	move_and_slide()
