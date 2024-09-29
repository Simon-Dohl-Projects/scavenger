extends Node2D

@onready var ui: UI = %UI
@onready var run_hint: Label = %Run
@onready var jetboots_hint: Label = %JetBoots

@onready var spawn_platform: Node2D = %SpawnPlatform
@onready var spawn_ruin_exit: Node2D = %SpawnRuin

func _ready() -> void:
	ui.start_timer()
	run_hint.visible = false
	jetboots_hint.visible = false

func _on_entrance_body_entered(body: Node2D) -> void:
	if body is Player:
		pass

func _on_run_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: run_hint.visible = true

func _on_run_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D: run_hint.visible = false

func _on_jet_boots_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.jet == false: jetboots_hint.visible = true

func _on_jet_boots_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D: jetboots_hint.visible = false
