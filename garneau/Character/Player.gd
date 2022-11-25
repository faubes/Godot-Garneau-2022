extends Node2D

var CurrentPlayer : BasePlayer
var BluePlayer := preload("res://Character/BluePlayer.tscn")
var GreenPlayer := preload("res://Character/GreenPlayer.tscn")
var PinkPlayer := preload("res://Character/PinkPlayer.tscn")
var StartLocation

onready var HealthBar = $Camera2D/CanvasLayer/HealthBar
export(int) var max_hearts = 4

signal took_damage


func _ready():
	StartLocation = self.position
	swap_player(GreenPlayer)
	var err = connect("took_damage", $Camera2D/CanvasLayer/HealthBar, "take_damage")
	if err:
		print(err)
	HealthBar.set_max_hearts(max_hearts)


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


func _on_SafeZone_body_exited(body):
	if body == CurrentPlayer:
		emit_signal("took_damage")
		CurrentPlayer.set_position(StartLocation)


