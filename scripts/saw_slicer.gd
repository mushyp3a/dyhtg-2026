extends Node2D

@export var line: PackedScene
@export var line_parent: Node2D
@export var line_length: float
@export var seg_size: int

var seg_ix: int = 0
var side_ix: int = 0

func start_slicing() -> void:
	seg_ix = 0
	side_ix = 0

func slice() -> void:
	if side_ix < 4:
		var instance: Node2D = line.instantiate()
		instance.global_position = position
		instance.rotation = rotation
		line_parent.add_child(instance)
		seg_ix += 1
		if seg_ix >= seg_size:
			seg_ix = 0
			rotate(0.5*PI)
			var inc: Vector2 = Vector2(0,0)
			match side_ix:
				0:
					inc = Vector2(0.5*line_length,0.5*line_length)
				1:
					inc = Vector2(-0.5*line_length,0.5*line_length)
				2:
					inc = Vector2(-0.5*line_length,-0.5*line_length)
				3:
					inc = Vector2(0,-0.5*line_length)
			position += inc
			side_ix += 1
		else:
			var inc: Vector2 = Vector2(0,0)
			match side_ix:
				0:
					inc = Vector2(line_length,0)
				1:
					inc = Vector2(0,line_length)
				2:
					inc = Vector2(-line_length,0)
				3:
					inc = Vector2(0,-line_length)
			position += inc
