extends Node

var i = 1
var current = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../RythmNotifier".beats(1).connect(securitise)
	$"../RythmNotifier".beats(1).connect(scaler)

func securitise(x) -> void:
	current = i
	i += 1
	if i == 5:
		i = 1
	
	if current == 1:
		$".".texture = load("res://images/jerma_security_back.png")
	if current == 4:
		$".".texture = load("res://images/jerma_security.png")

func scaler(a) -> void:
	if current % 2 != 0:
		$".".scale = Vector2(.6,.6)
	else:
		$".".scale = Vector2(.5,.5)
