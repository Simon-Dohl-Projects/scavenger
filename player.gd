class_name Player extends CharacterBody2D

const BASE_SPEED: float = 300.0
const JUMP_VELOCITY: float = -800.0

@export var jet: bool = false
@export var artifact: bool = false

var speed_modifier: float = 1
var speed: float:
	get(): return BASE_SPEED * speed_modifier
var gravity: float = 2
var coyote: bool = false
var base_jumps: int = 1
var jumps_left: int = base_jumps
var space_pressed: bool = false

@onready var coyote_timer: Timer = %Coyote
@onready var flashlight: PointLight2D = %Flashlight
@onready var space_timer: Timer = %Space
@onready var sprite: Node2D = %Sprite
@onready var interactor: InteractComponent = %InteractComponent
@onready var jet_effect: CPUParticles2D = %JetEffect
@onready var hitbox: CollisionShape2D = %Hitbox

func _physics_process(delta: float) -> void:
	if not is_on_floor() and jumps_left > 0 and coyote == false:
		coyote = true
		coyote_timer.start()

	flashlight.rotation = flashlight.global_position.direction_to(get_global_mouse_position()).angle()

	if jet: 
		if Input.is_action_pressed("space"):
			gravity = 1
			jet_effect.emitting = true
		else:
			gravity = 2
			jet_effect.emitting = false
	if not is_on_floor(): velocity += get_gravity() * delta * gravity

	var direction: float = Input.get_axis("a", "d")
	if direction != 0: sprite.scale.x = direction
	if Input.is_action_pressed("shift"): speed_modifier = 2
	else: speed_modifier = 1
	if direction: velocity.x = lerp(velocity.x, direction * speed, 0.7)
	elif is_on_floor(): velocity.x = lerp(velocity.x, 0.0, 0.4)
	else: velocity.x = lerp(velocity.x, 0.0, 0.1)

	move_and_slide()
	
	if is_on_floor():
		if jumps_left < base_jumps: jumps_left = base_jumps
		if space_pressed: jump()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("f"): flashlight.enabled = !flashlight.enabled
	if event.is_action_pressed("space"):
		if not jump():
			space_pressed = true
			space_timer.start()
	if event.is_action_pressed("e"):
		var collected = interactor.interact()
		if collected != null and collected is Array:
			for group in collected:
				match group:
					"JetBoots": jet = true
					"Artifact": artifact = true
					_: print(str(collected) + " has no functionality")

func jump() -> bool:
	coyote = false
	if jumps_left > 0:
		jumps_left -= 1
		velocity.y = JUMP_VELOCITY
		return true
	return false

#region signals
func _on_coyote_timeout() -> void:
	if coyote: jumps_left -= 1
	coyote = false

func _on_space_timeout() -> void: space_pressed = false
#endregion
