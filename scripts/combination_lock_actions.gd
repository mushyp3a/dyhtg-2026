extends Node

static var combination_lock_singleton: CombinationLock
@export var combination_lock: CombinationLock


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	combination_lock_singleton = combination_lock


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	print("You've won... This round (combination lock) >:3")
	match interaction:
		"l":
			combination_lock_singleton.comb_left()
		"r":
			combination_lock_singleton.comb_right()	
	
static func onFailure(interaction: String) -> void:
	print("Restarting combination lock level sucker! >=)")
	SceneChanger.restart_level()
