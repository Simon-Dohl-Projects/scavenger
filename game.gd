extends Node

@onready var menu: Menu = %Menu

var world: String = "res://world.tscn"
var world_instance: World

func _ready() -> void:
	Globals.victory.connect(victory)

func _on_menu_start_pressed() -> void:
	menu.visible = false
	world_instance = load(world).instantiate()
	world_instance.esc.connect(return_to_menu)
	add_child(world_instance)

func return_to_menu() -> void:
	world_instance.queue_free()
	menu.visible = true

func victory() -> void:
	return_to_menu()
	menu.to_victory()
