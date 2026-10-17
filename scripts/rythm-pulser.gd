extends Node

var bpm: int
var beatWindow = 0.2
var delay = 0.5 - beatWindow/2
var i = 1
var beatActive = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../RythmNotifier".beats(1).connect(scaler)

func scaler(a) -> void:
	if i % 2 != 0:
		$".".scale = Vector2(1.2,1.2)
	else:
		$".".scale = Vector2(1,1)
		
	if i == 4:
		$".".scale = Vector2(2,2)
		
	i += 1
	if i == 5:
		i = 1
