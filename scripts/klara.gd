extends CharacterBody2D


var speed = 200.0
@onready var sprite = $Sprite2D
var controlable = false

func _physics_process(delta: float) -> void:
	if controlable:
		var direction := Input.get_axis("left", "right")
		if direction > 0: sprite.flip_h = true
		elif direction < 0: sprite.flip_h = false
		if direction != 0:
			velocity.x = direction * speed
			sprite.animation = "walking"
		else:
			velocity.x = 0
			sprite.animation = "idle"
		if not is_on_floor(): velocity += get_gravity() * delta
		move_and_slide()
