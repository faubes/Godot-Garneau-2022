extends Sprite



func _on_Area2D_body_entered(body):
	var player = body as BasePlayer
	if player:
		player.heal_damage(2)
		queue_free()
