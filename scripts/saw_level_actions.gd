extends Node

static var state: int = 0
static var max_state: int = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
static func start_level():
	state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	state += 1
	if state < max_state:
		pass
	elif state == max_state:
		explode_wall()
		max_state += 1
	
static func onFailure(interaction: String) -> void:
	print("fail fail fail pathetic")
	
static func explode_wall() -> void:
	pass
