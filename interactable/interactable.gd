class_name Interactable extends Area2D

@export var interact_hint: Node = null

func enable_interact_hint() -> void: interact_hint.visible = true

func disable_interact_hint() -> void: interact_hint.visible = false

func interact(interactor: Node): print(str(get_parent()) + " interact function not implemented")

func _ready() -> void: interact_hint.visible = false
