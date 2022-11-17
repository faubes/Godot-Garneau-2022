extends Control

var heart := preload("res://Character/Health/Heart.tscn")
export var MAX_HEARTS = 4

var current_health = MAX_HEARTS * 2 # each heart counts for 2 hits / half heart


func _ready():
	for i in range(MAX_HEARTS):
		var new_heart = heart.instance()
		$MarginContainer/HBoxContainer.add_child(new_heart)

