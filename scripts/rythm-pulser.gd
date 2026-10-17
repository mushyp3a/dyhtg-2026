extends Node

var bpm: int
var beatWindow = 0.2
var delay = 0.5 - beatWindow/2
var i = 1
var beatActive = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../RythmNotifier".beats(1).connect(scaler)

func scaler(a) -> void:
	if i % 2 != 0:
		$".".scale = Vector2(1.2,1.2)
	else:
		$".".scale = Vector2(1,1)
		
	if i == 4:
		$".".scale = Vector2(2,2)
		
	if i == 3:
		beatHit()
		
	i += 1
	if i == 5:
		i = 1
	
func beatHit() -> void:
	await get_tree().create_timer(delay).timeout
	beatActive = true
	await get_tree().create_timer(beatWindow).timeout
	beatActive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("jerma") and beatActive:
		print("RAHHH")
	pass

func _physics_process(delta: float) -> void:
	pass
