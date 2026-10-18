extends Node

var i = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	print("kill me")
	#if i % 2 == 1:
# do this to alternate between moving jerma using above if then moving camera using else for next success ie holding down success to move jerma and release success to move camera

static func onFailure(interaction: String) -> void:
	print("fail fail fail pathetic")
