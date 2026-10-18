extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://ui stuff/credits.tscn")


func _on_level_select_pressed() -> void:
	#scene changer test below delete
	SceneChanger.next_level()
	pass # Replace with function body.
