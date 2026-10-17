extends Node

var beatWindow = 0.2
var rythmNotifier
var delay
var i = 1
var j = 0
var beatActive = false
var barPos: int
var interaction
var failed = false

var jermaSquish = false
var enemySquish = false

@export var level: Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rythmNotifier = $"../RythmNotifier"
	delay = rythmNotifier.beat_length - beatWindow/2
	rythmNotifier.beats(1).connect(beatHit)
	
func beatHit(x) -> void:
	barPos = i-1
	
	if j < level.bars.size():
		var currentBar = level.bars[j][barPos]
		
		i += 1
		if i == 5:
			i = 1
			j += 1
	
		await get_tree().create_timer(delay).timeout
		interaction = currentBar
		jermaSquish = false
		enemySquish = false
		failed = true if interaction != "0" else false
		beatActive = true
		await get_tree().create_timer(beatWindow).timeout
		beatActive = false
		if failed == true:
			level.magicalMysteryScript.onFailure(interaction)
			failed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("jerma") or Input.is_action_just_pressed("jerma") and beatActive:
		jermaSquish = true
	if Input.is_action_just_released("enemy") or Input.is_action_just_pressed("enemy") and beatActive:
		enemySquish = true
		
	if beatActive:
		if (interaction == "b" and jermaSquish and enemySquish) or (interaction == "l" and jermaSquish and not enemySquish) or (interaction == "r" and enemySquish and not jermaSquish):
			level.magicalMysteryScript.onSuccess(interaction)
			failed = false
			jermaSquish = false
			enemySquish = false
		
