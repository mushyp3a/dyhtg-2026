extends Node

var beatWindow = 0.2
var rythmNotifier
var delay
var i = 1
var j = 0
var beatActive = false
var barPos: int
var interaction

@export var level: Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rythmNotifier = $"../RythmNotifier"
	delay = rythmNotifier.beat_length - beatWindow/2
	rythmNotifier.beats(1).connect(beatHit)
	
func beatHit(x) -> void:
	barPos = i-1
	interaction = level.bars[j][barPos]
	await get_tree().create_timer(delay).timeout
	beatActive = true
	
	await get_tree().create_timer(beatWindow).timeout
	beatActive = false
	
	i += 1
	if i == 5:
		i = 1
		j += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interaction == "l" and Input.is_action_just_released("jerma") and beatActive:
		level.magicalMysteryScript.onSuccess(interaction)
	if interaction == "r" and Input.is_action_just_released("enemy") and beatActive:
		level.magicalMysteryScript.onSuccess(interaction)
	if interaction == "b" and Input.is_action_just_released("jerma") and Input.is_action_just_released("enemy") and beatActive:
		level.magicalMysteryScript.onSuccess(interaction)
	if Input.is_action_just_released("jerma") and beatActive:
		print("RAHHH")
		
	if Input.is_action_pressed("enemy"):
		print("1234"[2])
