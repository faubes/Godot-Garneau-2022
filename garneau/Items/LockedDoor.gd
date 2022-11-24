extends Area2D

export(int) var next_world = 1


func _on_LockedDoor_body_entered(body):
	var player = body as BasePlayer
	if player:
		var children = player.get_children()
		for child in children:
			var key = child as Key
			if key:
				print("open!")
				WorldManager.load_level(next_world)
				key.queue_free()

