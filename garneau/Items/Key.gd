extends Area2D
class_name Key

export var carry_height = 5

func _on_Key_body_entered(body):
	print("collision")
	var player = body as BasePlayer
	if player:
		#$CollisionShape2D.disabled = true
		$AnimationPlayer.play("Spin")
		player.pickup(self)
