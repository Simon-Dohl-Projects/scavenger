class_name Interactable extends Area2D

signal interacted(interactor: Node)

@export var interact_hint: Node = null

func enable_interact_hint() -> void: interact_hint.visible = true

func disable_interact_hint() -> void: interact_hint.visible = false

func interact(interactor: Node): interacted.emit(interactor)

func _ready() -> void: interact_hint.visible = false
