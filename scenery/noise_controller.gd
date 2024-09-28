extends Node2D

@onready var noise: Texture = load("res://scenery/pillar.tres")
enum dir{left, right}
@export var direction: dir = dir.left
var time: float = 0
var last: float = 0
var speed: float = 0.01

func _physics_process(delta: float) -> void:
	time += delta*4
	last += delta
	if last > speed:
		last -= speed
		noise.noise.offset.x = -time if direction == dir.right else time
