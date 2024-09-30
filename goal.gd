extends Interactable

func _ready() -> void:
	visible = false

func _on_interacted(interactor: Node) -> void:
	if interactor is Player:
		if interactor.artifact: Globals.victory.emit()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.artifact: visible = true
