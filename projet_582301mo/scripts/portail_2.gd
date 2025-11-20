# portail_1.gd
extends Area2D

var entered = false
@onready var honeybucket_node = get_node_or_null("../key/honeybucket") # adjust path

func _has_key_been_taken() -> bool:
	# If honeybucket node no longer exists, assume key taken
	return honeybucket_node == null or not is_instance_valid(honeybucket_node)

func _on_body_entered(body):
	if body.name == "Player":
		entered = true
		print("player entered portal; key taken", _has_key_been_taken())

func _on_body_exited(body):
	if body.name == "Player":
		entered = false
		if not _has_key_been_taken():
			print("out_portal_zone")

func _process(_delta):
	if entered and Input.is_action_just_pressed("enter_portal"):
		if _has_key_been_taken():
			get_tree().change_scene_to_file("res://scenes/zone_3.tscn")
		else:
			print("You need the key to enter this portal!")
