extends CharacterBody2D


var speed = 200.0
@onready var sprite = $Sprite2D
var controlable = false
var dir = 0
var ending = false
func _physics_process(delta: float) -> void:
	if controlable:
		var direction := Input.get_axis("left", "right")
		if Input.is_action_pressed("jump") and is_on_floor():
			velocity.y = -350.0
		if direction > 0: sprite.flip_h = true
		elif direction < 0: sprite.flip_h = false
		if direction != 0:
			velocity.x = direction * speed
			sprite.animation = "walking"
		else:
			velocity.x = 0
			sprite.animation = "idle"
		if not is_on_floor(): velocity += get_gravity() * delta
	else:
		if dir != 0:
			sprite.animation = "ending"
			velocity.x = dir*speed
		else:
			sprite.animation = "idle"
			velocity.x = 0
		if not is_on_floor() and not ending:
			velocity += get_gravity() * delta
			sprite.animation = "jump"
	move_and_slide()
