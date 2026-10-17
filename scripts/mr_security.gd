extends Node

var i = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../RythmNotifier".beats(1).connect(securitise)

func securitise(x) -> void:
	var current = i
	i += 1
	if i == 5:
		i = 1
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
