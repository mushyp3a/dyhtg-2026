extends Node

static var state: int = 0
static var max_state: int = 16

static var sawSingleton: SawSlicer
@export var saw: SawSlicer

static var explosion_transition_node_singleton: Transition
@export var explosion_transition_node: Transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sawSingleton = saw
	explosion_transition_node_singleton = explosion_transition_node
	
static func start_level():
	state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	print("Succeed the saw mission! ^v^")
	state += 1
	if state < max_state:
		sawSingleton.slice()
	elif state == max_state:
		explode_wall()
		SceneChanger.next_level(0.7)
	
static func onFailure(interaction: String) -> void:
	print("Failed the saw mission :C")
	SceneChanger.restart_level()
	
static func explode_wall() -> void:
	explosion_transition_node_singleton.start_transitioning()
