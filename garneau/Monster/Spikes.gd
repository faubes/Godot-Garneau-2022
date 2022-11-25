extends Sprite
class_name Spikes


func _on_Area2D_body_entered(body):
	var player = body as BasePlayer
	if player:
		player.take_damage(1)
