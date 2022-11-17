extends Node2D

var CurrentPlayer : BasePlayer
var BluePlayer := preload("res://Character/BluePlayer.tscn")
var GreenPlayer := preload("res://Character/GreenPlayer.tscn")
var PinkPlayer := preload("res://Character/PinkPlayer.tscn")
var StartLocation


func _ready():
	StartLocation = self.position
	swap_player(GreenPlayer)

func swap_player(NewPlayer : Resource):
	var prev_transform : Transform = self.transform
	if CurrentPlayer:
		prev_transform = CurrentPlayer.transform
		remove_child(CurrentPlayer)
		
	CurrentPlayer = NewPlayer.instance()
	add_child(CurrentPlayer)
	CurrentPlayer.set_as_toplevel(true)
	CurrentPlayer.set_transform(prev_transform)

	
func switch_alien() -> bool:
	if Input.is_action_pressed("ui_focus_next"):
		if Input.is_action_just_pressed("ui_right"):
			if not CurrentPlayer.name == "BluePlayer":	
				swap_player(BluePlayer)
				return true
		if Input.is_action_just_pressed("ui_left"):
			if not CurrentPlayer.name == "GreenPlayer":
				swap_player(GreenPlayer)
				return true
		if Input.is_action_just_pressed("ui_up"):
			if not CurrentPlayer.name == "PinkPlayer":
				swap_player(PinkPlayer)
				return true
	return false
	
func _physics_process(delta):
	
	if switch_alien():
		return

	CurrentPlayer.physics_process(delta)


func _on_SafeZone_body_exited(_body):
	CurrentPlayer.set_position(StartLocation)
