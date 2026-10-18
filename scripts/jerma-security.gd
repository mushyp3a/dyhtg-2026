extends Node
static var rounds = 0
const hide = preload("res://images/jerma_hiding.png")
const run = preload("res://images/jerma_dash.png")
static var moving = false
static var distance_moved = 0.0


static func onSuccess(interaction: String) -> void:
	print("past mistakes are just new information")
	rounds = rounds + 1
	if rounds == 4:
		SceneChanger.next_level()
	#im so so sorry
	#i tried my very best on this
	#could not het it to work :(



static func onFailure(interaction: String) -> void:
	print("they seem so desperate for loving but baby im not")
	distance_moved = 0.0
	moving = false
	rounds = 0
	SceneChanger.restart_level()
