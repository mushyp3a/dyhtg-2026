extends Node

class_name Transition

var transitioning: bool = true
var transition_state: int = 0
var transition_time: float = 0

@export var transition_node: Node2D
@export var transition_max_time: float
@export var transition_max_rot: float
@export var transition_max_scale: Vector2

func start_transitioning() -> void:
	transitioning = true
	transition_time = 0
	transition_state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if transitioning:
		transition_time += delta
		if transition_time > transition_max_time:
			if transition_state == 0:
				transition_state = 1
				transition_time = 0
			else:
				transitioning = false
		var coef: float = transition_time/transition_max_time
		if transition_state == 0:
			transition_node.scale = coef*transition_max_scale
		else:
			transition_node.scale = transition_max_scale - coef*transition_max_scale
		transition_node.rotation_degrees = coef*transition_max_rot
