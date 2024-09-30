class_name MainMenu extends Control

signal start_pressed
signal options_pressed()
signal leaderboard_pressed

@onready var name_input: LineEdit = %NameInput

func _ready() -> void:
	name_input.text = Globals.player_name

func _on_start_pressed() -> void:
	start_pressed.emit()

func _on_option_pressed() -> void:
	options_pressed.emit()

func _on_quit_pressed() -> void:
	get_tree().quit()

#func _on_delete_save_pressed():
	#Globals.delete_save()

func _on_name_input_text_changed(new_text: String) -> void:
	Globals.player_name = new_text

func _on_leaderboard_pressed() -> void:
	leaderboard_pressed.emit()
