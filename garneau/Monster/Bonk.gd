extends KinematicBody2D

var velocity := Vector2.ZERO

func _physics_process(delta):
	
	velocity += 9.8 * Vector2.DOWN # gravity
	
	if not is_zero_approx(velocity.length()):
		velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	velocity += 500* Vector2.UP
	$Timer.start()
