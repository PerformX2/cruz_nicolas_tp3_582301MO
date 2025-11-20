extends Area2D

var entered = false
@onready var honeybucket_node = get_node_or_null("../key/honeybucket") # adjust path

@onready var sfx_portail_closed: AudioStreamPlayer = $sfx_portail_closed
@onready var sfx_portail_opened: AudioStreamPlayer = $sfx_portail_opened


func _has_key_been_taken() -> bool:
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
			# Play portal opened sound
			if sfx_portail_opened:
				sfx_portail_opened.play()
				await sfx_portail_opened.finished  # Wait for the sound to finish
			get_tree().change_scene_to_file("res://scenes/zone_3.tscn")
		else:
			# Play portal closed sound
			if sfx_portail_closed:
				sfx_portail_closed.play()
			print("You need the key to enter this portal!")
