extends Node

static var i = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func onSuccess(interaction: String) -> void:
	print("kill me")
	var root = (Engine.get_main_loop() as SceneTree).root
	if i % 2 == 1:
		var jerma = root.find_child("JermaHiding", true, false)
		var newJerma = jerma.position + Vector2(757.487, 0)
		jerma.texture = load("res://images/jerma_dash.png")
		var tween = jerma.create_tween()
		tween.tween_property(jerma, "position", newJerma, 0.3)
		tween.tween_callback(func(): jerma.texture = load("res://images/jerma_hiding.png"))
	else:
		var camera = root.find_child("Camera2D", true, false)
		var newCamera = camera.position + Vector2(757.487, 0)
		camera.create_tween().tween_property(camera, "position", newCamera, 0.3)
	i += 1
# do this to alternate between moving jerma using above if then moving camera using else for next success ie holding down success to move jerma and release success to move camera

static func onFailure(interaction: String) -> void:
	print("fail fail fail pathetic")
	i = 1
	(Engine.get_main_loop() as SceneTree).reload_current_scene()
