extends Node

signal victory

var seconds: float = 0
var leaderboard: Array = []
var player_name: String = ""

func _ready() -> void:
	victory.connect(resolve_victory)

func resolve_victory() -> void:
	await get_tree().process_frame
	leaderboard.append([player_name, seconds, Time.get_datetime_string_from_system()])
	leaderboard.sort_custom(func(a,b): return a[1] < b[1])
	if len(leaderboard) > 10: leaderboard.resize(10)

func seconds_to_timestring(seconds: float):
	var secs: float = snapped(seconds-floor(seconds/60)*60,0.01)
	return str(floor(seconds/60)) + ":" + ("0" if secs < 10 else "") + str(secs)
