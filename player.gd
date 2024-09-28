extends CharacterBody2D

const BASE_SPEED: float = 300.0
const JUMP_VELOCITY: float = -800.0

var speed_modifier: float = 1
var speed: float:
	get(): return BASE_SPEED * speed_modifier
@onready var flashlight: PointLight2D = %Flashlight
var gravity: float = 2
var jet: bool = false

func _physics_process(delta: float) -> void:
	flashlight.rotation = flashlight.global_position.direction_to(get_global_mouse_position()).angle()

	if jet: gravity = 1 if Input.is_action_pressed("space") else 2
	if not is_on_floor(): velocity += get_gravity() * delta * gravity

	if Input.is_action_just_pressed("space") and is_on_floor(): velocity.y = JUMP_VELOCITY

	var direction: float = Input.get_axis("a", "d")
	if Input.is_action_pressed("shift"): speed_modifier = 2
	else: speed_modifier = 1
	if direction: velocity.x = lerp(velocity.x, direction * speed, 0.7)
	else: velocity.x = lerp(velocity.x, 0.0, 0.7)

	move_and_slide()
