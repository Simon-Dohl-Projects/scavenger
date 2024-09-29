class_name CollectableComponent extends Interactable

const COLLECT_DURATION: float = 0.03

func _ready() -> void:
	interact_hint.visible = false

func interact(collector: Node):
	super.interact(collector)
	var parent: Array[StringName] = get_parent().get_groups()
	var tween: Tween = create_tween()
	tween.tween_property(get_parent(), "position", collector.position, COLLECT_DURATION)
	tween.tween_property(get_parent(), "scale", Vector2.ZERO, COLLECT_DURATION)
	tween.finished.connect(get_parent().queue_free)
	return parent
