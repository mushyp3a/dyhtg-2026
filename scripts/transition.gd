extends Node

var transitioning: bool = false
var transition_time: float = 0

@export var transition_node: Node2D
@export var transition_max_time: float
@export var transition_max_rot: float
@export var transition_max_scale: Vector2

func start_start() -> void:
	transitioning = true
	transition_time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	transition_time += delta
	if transitioning:
		var coef: float = transition_max_time/transition_time
		transition_node.scale = coef*transition_max_scale
		transition_node.rotation_degrees = coef*transition_max_rot
