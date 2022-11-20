extends Area2D




func _on_LockedDoor_body_entered(body):
	var player = body as BasePlayer
	if player:
		var children = player.get_children()
		for child in children:
			var key = child as Key
			if key:
				print("open!")
				key.queue_free()

