extends Node2D
class_name Player

var CurrentPlayer : BasePlayer
var BluePlayer := preload("res://Character/BluePlayer.tscn")
var GreenPlayer := preload("res://Character/GreenPlayer.tscn")
var PinkPlayer := preload("res://Character/PinkPlayer.tscn")
var StartLocation

onready var HealthBar = $Camera2D/CanvasLayer/HealthBar
export(int) var max_hearts = 4


func _ready():
	StartLocation = self.position
	swap_player(GreenPlayer)
	HealthBar.set_max_hearts(max_hearts)


func swap_player(NewPlayer : Resource):
	var prev_transform : Transform = self.transform
	var new_player = NewPlayer.instance()
	if CurrentPlayer:
		for child in CurrentPlayer.get_children():
			if child is Key:
				new_player.pickup(child)
		prev_transform = CurrentPlayer.transform
		remove_child(CurrentPlayer)
		CurrentPlayer.queue_free()
		
	new_player.set_as_toplevel(true)
	new_player.set_transform(prev_transform)
	add_child(new_player)
	CurrentPlayer = new_player
	var err = CurrentPlayer.connect("took_damage", self, "take_damage")
	if err:
		print(err)


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


func respawn():
	take_damage(1)
	CurrentPlayer.set_position(StartLocation)


func take_damage(var i):
	HealthBar.take_damage(i)
