extends TextureRect
class_name Heart

var Fullness = 2

func _ready():
	texture.pause = true
	texture.current_frame = 2

func is_full() -> bool:
	return Fullness == 2

func is_half() -> bool:
	return Fullness == 1
	
func is_empty() -> bool:
	return Fullness == 0
	

func take_damage():
	if Fullness == 2:
		Fullness = 1
		texture.current_frame = 1
		return
	if Fullness == 1:
		Fullness = 0
		texture.current_frame = 0
		return
	print("Empty heart took damage!?")
	

func heal_damage():
	if Fullness == 1:
		Fullness = 2
		texture.current_frame = 2
		return
	if Fullness == 0:
		Fullness = 1
		texture.current_frame = 1
		return
	print("Full heart healing? error?")
	
