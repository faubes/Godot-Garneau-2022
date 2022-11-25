extends Area2D


func _on_SafeZone_body_exited(body):
	var player = body as BasePlayer
	if player:
		player.die()

