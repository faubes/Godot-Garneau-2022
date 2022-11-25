extends BasePlayer

func _ready():
	AnimationPlayer = $AnimationPlayer
	$Camera2D.current = true
	apply_gravity = true
	
	
func get_input() -> Vector2 :
	return Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))


func physics_process(delta):
	if not in_air:
		horizontal_scalar = GROUND_HORIZONTAL_SCALAR
		if Input.is_action_pressed("ui_accept"):
			AnimationPlayer.play("jump")
			velocity += Vector2.UP * JUMP_HEIGHT
			snap = Vector2.ZERO

	.physics_process(delta)
