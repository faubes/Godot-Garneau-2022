extends MarginContainer

var heart := preload("res://Character/Health/Heart.tscn")
export var MAX_HEARTS = 4

var current_health = MAX_HEARTS * 2 # each heart counts for 2 hits / half heart

var hearts : Array
var current_heart : Heart

func _ready():
	for _i in range(MAX_HEARTS):
		var new_heart = heart.instance()
		hearts.append(new_heart)
		$HBoxContainer.add_child(new_heart)
	current_heart = hearts.back()


func take_damage():
	current_health = current_health - 1
	if current_health < 0:
		print("arrrrr")
		return
	current_heart = hearts.front()
	if current_heart.is_empty():
		hearts.append(hearts.pop_front())
		current_heart = hearts.front()
	current_heart.take_damage()	
	
