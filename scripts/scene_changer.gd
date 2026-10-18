extends Node
var current_level = 0

# MAKE SURE TO UNCOMMENT AFTER COMMIT
var levels = [
	# "res://scenes/saw_level.tscn",
	"res://scenes/security.tscn",
	#"res://scenes/lasers.tscn",
	# "res://scenes/hacking.tscn",
	# "res://scenes/combination_lock_level.tscn",
	#"res://scenes/punching.tscn"
	#"res://scenes/ending_scene.tscn"
]

var transition_node: TransitionNode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition_node = get_node("/root/TransitionNode") as TransitionNode

func next_level():
	current_level = current_level + 1
	if current_level < levels.size():
		get_tree().change_scene_to_file(levels[current_level])
		transition_node.start_transitioning()

#this function exists for replaying game
#other ways to do this if it breaks a bunch of shit
#please call leia in morning and ill fix it
#but cant test fully till game is done
func start_game():
	current_level = 0
	get_tree().change_scene_to_file(levels[current_level])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func restart_level():
	get_tree().reload_current_scene()
