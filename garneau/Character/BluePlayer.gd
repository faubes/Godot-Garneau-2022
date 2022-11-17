extends BasePlayer

export var TELEPORT_RANGE = 100

onready var TeleportParticle = $TeleportParticle

func _ready():
	AnimationPlayer = $BluePlayer
	TeleportParticle.set_emitting(false)
	$Camera2D.current = true
			
func physics_process(delta):
	.physics_process(delta)
	var input : Vector2 = get_input()
	
	if Input.is_action_pressed("ui_accept"):
		velocity = Vector2.ZERO
		if input.length() > 0.1:
			TeleportParticle.set_emitting(true)
			TeleportParticle.process_material.set_direction(Vector3(input.x, input.y, 0))
		else:
			TeleportParticle.set_emitting(false)

	if Input.is_action_just_released("ui_accept"):
		TeleportParticle.set_emitting(false)
		set_position(position + TELEPORT_RANGE * input)
