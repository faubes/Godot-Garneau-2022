extends Area2D
class_name Key

export var carry_height = 5

var carrier

func _on_spin_animation_finished():
	$CollisionShape2D.disabled = true
	if carrier:
		carrier.pickup(self)


func _on_Key_body_entered(body):
	print("collision")
	var player = body as BasePlayer
	if player:
		$AnimationPlayer.play("Spin")
		carrier = player
