extends MarginContainer

var heart := preload("res://Character/Health/Heart.tscn")
var max_hearts = 4

var current_health = max_hearts * 2 # each heart counts for 2 hits / half heart

var hearts := {}
var current_heart_index : int

func _ready():
	set_max_hearts(max_hearts)

	
func set_max_hearts(new_max_hearts):
	max_hearts = new_max_hearts
	for child in $HBoxContainer.get_children():
		$HBoxContainer.remove_child(child)
		hearts = {}
		child.queue_free()
	for i in range(max_hearts):
		var new_heart = heart.instance()
		hearts[i] = new_heart
		$HBoxContainer.add_child(new_heart)
	current_heart_index = 0
	current_health = max_hearts * 2


func set_health(i):
	if (current_health < i):
		while (current_health < i):
			heal()
	elif (current_health > i):
		while (current_health > i):
			hurt()


func take_damage(i):
	set_health(max(current_health - i, 0))

	
func heal_damage(i):
	set_health(min(current_health + i, max_hearts*2))


func heal():
	current_health += 1
	if hearts[current_heart_index].is_full():
		current_heart_index = int(max(0, current_heart_index -1))
	hearts[current_heart_index].heal_damage()


func hurt():
	current_health -= 1
	if current_health < 0:
		print("arrrrr")
		return
	if hearts[current_heart_index].is_empty():
		current_heart_index = int(min(current_heart_index + 1, hearts.size() -1))
	hearts[current_heart_index].take_damage()	
	
