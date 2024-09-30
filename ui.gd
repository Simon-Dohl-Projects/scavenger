class_name UI extends CanvasLayer

@onready var timer: Label = %Timer
var time: float = 0
var minutes: int = 0

func _ready() -> void:
	Globals.victory.connect(set_global_time)

func set_global_time() -> void:
	Globals.seconds = time + minutes*60

func start_timer() -> void:
	time = 0
	minutes = 0

var filler: String:
	get(): return "0" if time < 10.0 else ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	time += delta
	if time >= 60.0:
		minutes += 1
		time = time-60.0
	timer.set_deferred("text", "Time: " + str(minutes) + ":" + filler + str(snapped(time,0.01)))
