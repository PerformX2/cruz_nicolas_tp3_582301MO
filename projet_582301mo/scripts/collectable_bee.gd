extends Area2D

var is_collected = false
var stream_paused = true

func _on_body_entered(body):
	if body is PlayerController and not is_collected:
		is_collected = true
		stream_paused = false
		$sfx_collected_bee.play()
		GameManager.add_collectable_bee()

		# Create a tween to scale down smoothly
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(0, 0), 0.3).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_BACK)

		# Wait for the tween to finish, then delete the node
		await get_tree().create_timer(1.8).timeout
		queue_free()
