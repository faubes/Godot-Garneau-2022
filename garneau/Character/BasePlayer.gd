class_name BasePlayer
extends KinematicBody2D

onready var AnimationPlayer
onready var Sprite := $Sprite
export var SPEED = 300
export var ACCEL = 100
export var JUMP_HEIGHT = 150
export var AIR_HORIZONTAL_SCALAR = 0.975
export var GROUND_HORIZONTAL_SCALAR = 1.005


var velocity := Vector2.ZERO

var apply_gravity := true
var gravity := Vector2(0, 9.8)
var snap := Vector2.DOWN * 1.5
var horizontal_scalar : float = 1

var in_air := true
var fast_fall := true

func _ready():
	$Camera2D.current = true
	velocity = move_and_slide_with_snap(Vector2.RIGHT, snap, Vector2.UP)
	apply_gravity = true
	
func get_input() -> Vector2 :
	return Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))
		
func physics_process(delta):
	var input_velocity = velocity.move_toward(get_input()*SPEED, ACCEL*delta)
	
	velocity.x = input_velocity.x
	in_air = not is_on_floor()
		
	if fast_fall and velocity.y > 0:
		fast_fall = false
		velocity += gravity
		
	if apply_gravity:
		velocity += gravity
		
	if in_air:
		horizontal_scalar = AIR_HORIZONTAL_SCALAR
	
	velocity = move_and_slide_with_snap(Vector2(velocity.x*horizontal_scalar, velocity.y), snap, Vector2.UP)
	
	var just_landed = in_air and is_on_floor()
	
	if just_landed:
		snap = Vector2.DOWN * 1.5
		in_air = false
		fast_fall = true
		
	if velocity.x < 0:
		$Sprite.flip_h = false
	if velocity.x > 0:
		$Sprite.flip_h = true

	if is_on_floor():
		if abs(velocity.x) > 0.1:
			AnimationPlayer.play("walk")
		else:
			AnimationPlayer.play("idle")
	
func pickup(o):
	o.get_parent().call_deferred("remove_child", o)
	call_deferred("add_child", o)
	o.position = o.carry_height * Vector2.UP
