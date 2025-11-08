extends Area2D
@onready var anim = $AnimatedSprite2D

var is_collected = false

func _on_body_entered(body):
	if body.name == "Player":
		var is_collected = true 
		$sfx_honey_pickedup.play()
		
		var tween = create_tween()

		tween.tween_property(self, "position", position + Vector2(0,-30), 0.5)

		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		
		tween.tween_callback(self.queue_free)
