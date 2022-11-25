extends MarginContainer

var heart := preload("res://Character/Health/Heart.tscn")
var max_hearts = 4

var current_health = max_hearts * 2 # each heart counts for 2 hits / half heart

var hearts : Array
var current_heart : Heart

func _ready():
	set_max_hearts(max_hearts)
	
func set_max_hearts(new_max_hearts):
	max_hearts = new_max_hearts
	for child in $HBoxContainer.get_children():
		$HBoxContainer.remove_child(child)
	for _i in range(max_hearts):
		var new_heart = heart.instance()
		hearts.append(new_heart)
		$HBoxContainer.add_child(new_heart)
	current_heart = hearts.back()

func set_health(i):
	if (current_health < i):
		while (current_health < i):
			heal_damage()
	elif (current_health > i):
		while (current_health > i):
			take_damage()


func heal_damage():
	if current_health == max_hearts * 2: #already full
		return
	current_health = current_health + 1
	current_heart = hearts.front()
	if current_heart.is_full():
		hearts.append(hearts.pop_front())
		current_heart = hearts.front()
	current_heart.heal_damage()


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
	
