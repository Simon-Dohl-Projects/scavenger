extends CharacterBody2D

const BASE_SPEED: float = 300.0
const JUMP_VELOCITY: float = -800.0

var speed_modifier: float = 1
var speed: float:
	get(): return BASE_SPEED * speed_modifier
@onready var flashlight: PointLight2D = %Flashlight
var gravity: float = 2
var jet: bool = false
var coyote: bool = false
@onready var coyote_timer: Timer = %Coyote
var base_jumps: int = 1
var jumps_left: int = base_jumps
var space_pressed: bool = false
@onready var space_timer: Timer = %Space

func _physics_process(delta: float) -> void:
	if is_on_floor():
		jumps_left = base_jumps
		if space_pressed: jump()
	elif jumps_left > 0 and coyote == false:
		coyote = true
		coyote_timer.start()
		
	flashlight.rotation = flashlight.global_position.direction_to(get_global_mouse_position()).angle()
	
	if jet: gravity = 1 if Input.is_action_pressed("space") else 2
	if not is_on_floor(): velocity += get_gravity() * delta * gravity

	var direction: float = Input.get_axis("a", "d")
	if Input.is_action_pressed("shift"): speed_modifier = 2
	else: speed_modifier = 1
	if direction: velocity.x = lerp(velocity.x, direction * speed, 0.7)
	elif is_on_floor(): velocity.x = lerp(velocity.x, 0.0, 0.4)
	else: velocity.x = lerp(velocity.x, 0.0, 0.1)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("f"): flashlight.enabled = !flashlight.enabled
	if event.is_action_pressed("space"):
		if not jump():
			space_pressed = true
			space_timer.start()

func jump():
	if jumps_left > 0:
		jumps_left -= 1
		velocity.y = JUMP_VELOCITY
		return true
	return false

#region signals
func _on_coyote_timeout() -> void: jumps_left -= 1

func _on_space_timeout() -> void: space_pressed = false
#endregion
