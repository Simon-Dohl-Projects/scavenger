class_name Landing extends Node2D

signal ruin_entered

@onready var run_hint: Label = %Run
@onready var jetboots_hint: Label = %JetBoots

@onready var spawn_platform: Node2D = %SpawnPlatform
@onready var spawn_ruin: Node2D = %SpawnRuin

func _ready() -> void:
	run_hint.visible = false
	jetboots_hint.visible = false

func _on_entrance_body_entered(body: Node2D) -> void:
	if body is Player: ruin_entered.emit()

func _on_run_body_entered(body: Node2D) -> void:
	if body is Player: run_hint.visible = true

func _on_run_body_exited(body: Node2D) -> void:
	if body is Player: run_hint.visible = false

func _on_jet_boots_body_entered(body: Node2D) -> void:
	if body is Player and body.jet == false: jetboots_hint.visible = true

func _on_jet_boots_body_exited(body: Node2D) -> void:
	if body is Player: jetboots_hint.visible = false
