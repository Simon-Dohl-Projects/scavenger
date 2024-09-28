extends CharacterBody2D

const BASE_SPEED = 300.0
const JUMP_VELOCITY = -400.0

var speed_modifier = 1
var speed:
	get(): return BASE_SPEED * speed_modifier
@onready var flashlight: PointLight2D = %Flashlight

func _physics_process(delta: float) -> void:
	flashlight.rotation = flashlight.global_position.direction_to(get_global_mouse_position()).angle()

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("a", "d")
	if Input.is_action_pressed("shift"): speed_modifier = 2
	else: speed_modifier = 1
	if direction: velocity.x = lerp(velocity.x, direction * speed, 0.7)
	else: velocity.x = lerp(velocity.x, 0.0, 0.7)

	move_and_slide()
