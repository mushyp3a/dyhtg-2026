class_name CombinationLock
extends Node

@export var lock: Node2D
@export var segments: int
@export var rotate_max_time: float

var rotate_time: float = 0
var rotating: bool = false
var rotating_origin: float
var rotating_target: float

func _process(delta: float) -> void:
	try_comb_rotate(delta)

func stop_rotating() -> void:
	rotating_origin = lock.rotation
	rotating = false
	rotate_time = 0

func comb_rotate_to(target: float) -> void:
	stop_rotating()
	rotating_target = target
	rotating = true
	
func try_comb_rotate(delta: float) -> void:
	if rotating:
		rotate_time += delta
		if rotate_time >= rotate_max_time:
			stop_rotating()
		var coef: float = rotate_time / rotate_max_time
		lock.rotation = rotating_origin + coef*(rotating_target-rotating_origin)

func comb_rotate(coef) -> void:
	comb_rotate_to(coef*2*PI / segments)
	
func comb_left() -> void:
	comb_rotate(-1)
	
func comb_right() -> void:
	comb_rotate(1)
