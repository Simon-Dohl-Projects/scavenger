class_name Ruin extends Node2D

signal used_entrance

@onready var spawn_entrance: Node2D = %SpawnEntrance
@onready var darkness: CanvasModulate = %Darkness
@onready var spawn_respawn: Node2D = %SpawnRespawn

func _ready() -> void: darkness.visible = true

func _on_entrance_body_entered(body: Node2D) -> void:
	if body is Player: used_entrance.emit()

func respawn(node: Node) -> void: if node is Player:
	node.global_position = spawn_respawn.global_position
