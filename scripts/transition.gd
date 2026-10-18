extends Node

class_name Transition

var audio_player: AudioStreamPlayer = AudioStreamPlayer.new()

var transitioning: bool = false
var transition_state: int = 0
var transition_time: float = 0

@export var transition_node: Node2D
@export var transition_max_time: float
@export var transition_max_rot: float
@export var transition_max_scale: Vector2
@export var transition_base_scale: Vector2

@export var sound_link: String
var sfx: Resource

func _ready() -> void:
	if sound_link != "":
		sfx = load(sound_link)
	add_child(audio_player)
	audio_player.stream = sfx

func start_transitioning() -> void:
	audio_player.stop()
	audio_player.stream = sfx
	audio_player.play()
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
	else:
		transition_node.scale = transition_base_scale
