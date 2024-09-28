extends Node2D

@onready var ui: UI = %UI

func _ready() -> void:
	ui.start_timer()
