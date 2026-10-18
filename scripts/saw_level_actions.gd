extends Node

static var state: int = 0
static var max_state: int = 16

static var sawSingleton: SawSlicer
@export var saw: SawSlicer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sawSingleton = saw
	
static func start_level():
	state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	state += 1
	if state < max_state:
		sawSingleton.slice()
	elif state == max_state:
		explode_wall()
		max_state += 1
	
static func onFailure(interaction: String) -> void:
	SceneChanger.restart_level()
	
static func explode_wall() -> void:
	pass
