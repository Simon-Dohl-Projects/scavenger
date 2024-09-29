extends Node2D

func _on_interactable_interacted(interactor: Node) -> void:
	Globals.victory.emit()
