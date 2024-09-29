class_name Ruin extends Node2D

signal used_entrance

@onready var spawn_entrance: Node2D = %SpawnEntrance
@onready var darkness: CanvasModulate = %Darkness

func _ready() -> void: darkness.visible = true

func _on_entrance_body_entered(body: Node2D) -> void:
	if body is Player: used_entrance.emit()
