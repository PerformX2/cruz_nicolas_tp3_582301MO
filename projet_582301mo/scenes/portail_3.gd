extends Area2D

var entered = false

func _on_body_entered(body):
	if body.name == "Player":
		entered = true

func _on_body_exited(body):
	if body.name == "Player":
		entered = false

func _process(_delta):
	if entered and Input.is_action_just_pressed("enter_portal"):
		get_tree().change_scene_to_file("res://scenes/end_menu.tscn")
