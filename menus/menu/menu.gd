class_name Menu extends Control

signal start_pressed

@onready var main: MainMenu = %Main
@onready var leaderboard: Control = %Leaderboard
@onready var victory: Control = %Victory

var menus: Array[Control] = []

#@onready var option: OptionsMenu = %Options
#@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
#@onready var music = preload("res://assets/SFX/worldMusic/Ambient5.ogg")
#
func _ready():
	menus = [main,leaderboard,victory]
	hide_menus()
	main.visible = true
	#audio_stream_player.stream = music
	#audio_stream_player.play()
#
#func _on_tree_exiting() -> void:
	#audio_stream_player.stream = null
#
#func _on_main_options_pressed() -> void:
	#main.visible = false
	#option.visible = true
#
#func _on_options_back_pressed() -> void:
	#main.visible = true
	#option.visible = false

func hide_menus() -> void: for menu in menus: menu.visible = false

func to_main() -> void:
	hide_menus()
	main.visible = true

func to_victory() -> void:
	hide_menus()
	victory.visible = true

func _on_main_leaderboard_pressed() -> void:
	hide_menus()
	leaderboard.visible = true

func _on_main_start_pressed() -> void: start_pressed.emit()

func _on_leaderboard_return_pressed() -> void: to_main()

func _on_victory_menu_pressed() -> void: to_main()
