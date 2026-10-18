extends Node
var current_level = 0
var music_player: AudioStreamPlayer

#music
var music = [
	#preload("res://sfx/StageOneSawing.wav"),
	#preload("res://sfx/StageTwoGuards.wav"),
	preload("res://sfx/StageFiveCombinationLock.wav"),
	preload("res://sfx/StageSixSafePunching.wav")
]

# MAKE SURE TO UNCOMMENT AFTER COMMIT
var levels = [
	# "res://scenes/saw_level.tscn",
	#"res://scenes/security.tscn",
	#"res://scenes/lasers.tscn",
	# "res://scenes/hacking.tscn",
	"res://scenes/combination_lock_level.tscn",
	"res://scenes/punching.tscn"
	#"res://scenes/ending_scene.tscn"
]

var transition_node: TransitionNode
var restart_transition_node: RestartTransitionNode

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition_node = get_node("/root/TransitionNode") as TransitionNode
	restart_transition_node = get_node("/root/RestartTransitionNode") as RestartTransitionNode
	music_player = AudioStreamPlayer.new()
	add_child(music_player)

func next_level(delay: float = 0):
	music_player.stop()
	await get_tree().create_timer(delay).timeout
	current_level = current_level + 1
	if current_level < levels.size():
		get_tree().change_scene_to_file(levels[current_level])
		music_player.stream = music[current_level]
		transition_node.start_transitioning()
		music_player.play()

#this function exists for replaying game
#other ways to do this if it breaks a bunch of shit
#please call leia in morning and ill fix it
#but cant test fully till game is done
func start_game():
	music_player.stop()
	current_level = 0
	get_tree().change_scene_to_file(levels[current_level])
	music_player.stream = music[current_level]
	music_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var jerma_restart_delay: float = 0.7

func restart_level():
	music_player.stop()
	print("Transitioning... >=)")
	restart_transition_node.start_transitioning()
	await get_tree().create_timer(jerma_restart_delay).timeout
	get_tree().reload_current_scene()
	music_player.stream = music[current_level]
	music_player.play()
