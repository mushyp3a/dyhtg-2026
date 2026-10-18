extends Node
static var character: Sprite2D
const leftPunch = preload("res://images/jerma_left_punch.png")
const rightPunch = preload("res://images/jerma_right_punch.png")
const neutral = preload("res://images/jerma_neutral_punch.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	character = $jerma


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	if interaction == "l":
		print("left baby")
		character.texture = leftPunch
	elif interaction == "r":
		print("actual right baby")
		character.texture = rightPunch

static func onFailure(interaction: String) -> void:
	print("FIALURE")
	SceneChanger.restart_level()
