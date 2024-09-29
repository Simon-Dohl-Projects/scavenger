extends Node2D

@onready var landing: Landing = preload("res://level/landing_area.tscn").instantiate()
@onready var ruin: Ruin = preload("res://level/ruin_interior.tscn").instantiate()

@onready var ui: UI = %UI
@onready var player: CharacterBody2D = %Player

func _ready() -> void:
	landing.ruin_entered.connect(enter_ruin)
	ruin.used_entrance.connect(exit_to_landing)
	ui.start_timer()
	add_child(landing)
	move_player(landing.spawn_platform)

func move_player(node: Node): player.global_position = node.global_position

func enter_ruin() -> void:
	call_deferred("remove_child", landing)
	call_deferred("add_child", ruin)
	await get_tree().physics_frame
	await get_tree().physics_frame
	move_player(ruin.spawn_entrance)

func exit_to_landing() -> void:
	call_deferred("remove_child", ruin)
	call_deferred("add_child", landing)
	move_player(landing.spawn_ruin)
