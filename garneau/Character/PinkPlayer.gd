extends BasePlayer

export var FLIP_HOP_HEIGHT := 25

var local_up := Vector2.UP
var local_gravity := Vector2(0, 2*0.98)
var can_land := true

func _ready():
	$FlipTimer.wait_time = 0.5
	AnimationPlayer = $PinkPlayer
	$Camera2D.current = true
	apply_gravity = false
	
func get_input() -> Vector2 :
	return Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
		
func physics_process(delta):
	var input_velocity = velocity.move_toward(get_input()*SPEED, ACCEL*delta)
	
	velocity.x = input_velocity.x
	in_air = not is_on_floor()
		
	if Input.is_action_just_pressed("ui_accept"):
		AnimationPlayer.play("jump")
		$Sprite.flip_v = not $Sprite.flip_v
		local_gravity *= -1
		local_up *= -1
		velocity += FLIP_HOP_HEIGHT * local_up
		in_air = true
		snap = Vector2.ZERO
		can_land = false
		$FlipTimer.start()

	velocity += local_gravity
	
	velocity = move_and_slide_with_snap(Vector2(velocity.x * horizontal_scalar, velocity.y), snap, local_up)
	
	if is_on_floor() and can_land:
		snap = local_up
		in_air = false
		
	if velocity.x < 0:
		$Sprite.flip_h = false
	if velocity.x > 0:
		$Sprite.flip_h = true

	if is_on_floor():
		if abs(velocity.x) > 0.1:
			AnimationPlayer.play("walk")
		else:
			AnimationPlayer.play("idle")
			


func _on_FlipTimer_timeout():
	can_land = true
