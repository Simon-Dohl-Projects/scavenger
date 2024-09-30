extends Control

signal menu_pressed

@onready var completion_time: Label = %CompletionTime

func _on_exit_pressed() -> void: menu_pressed.emit()

func _on_visibility_changed() -> void:
	if get_tree() == null: return
	await get_tree().process_frame
	if completion_time != null:
		completion_time.text = "Congratulations. You completed the game in " + Globals.seconds_to_timestring(Globals.seconds)
