extends Node
const leftPunch = preload("res://images/jerma_left_punch.png")
const rightPunch = preload("res://images/jerma_right_punch.png")
const neutral = preload("res://images/jerma_neutral_punch.png")
static var rounds = 0

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	var scene = Engine.get_main_loop().current_scene
	var character = scene.find_child("jerma", true, false)
	# above two lines are for finding jerma its werid cause file
	#isnt on same nodes as sprite2d
	if interaction == "l":
		print("left baby")
		character.texture = leftPunch
		rounds = rounds + 1
	elif interaction == "r":
		print("actual right baby")
		character.texture = rightPunch
		rounds = rounds + 1
	if rounds == 4:
		SceneChanger.next_level()

static func onFailure(interaction: String) -> void:
	print("FIALURE")
	rounds = 0
	SceneChanger.restart_level()
