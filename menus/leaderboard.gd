extends Control

signal return_pressed

@onready var table: Container = %Table
var table_contents: Array[Label] = []

func _ready() -> void: update()

func update() -> void:
	for entry: Label in table_contents: entry.queue_free()
	table_contents.clear()
	for entry in Globals.leaderboard:
		for column in entry:
			if column is float: column = Globals.seconds_to_timestring(column)
			var label: Label = Label.new()
			label.text = str(column)
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			table_contents.append(label)
	for entry in table_contents: table.add_child(entry)

func _on_button_pressed() -> void: return_pressed.emit()
