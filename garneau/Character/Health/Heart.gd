extends Node2D
class_name Heart

var Fullness = 2

func _ready():
	$AnimatedSprite.play("Full")

func is_full() -> bool:
	return Fullness == 2

func is_half() -> bool:
	return Fullness == 1
	
func is_empty() -> bool:
	return Fullness == 0
	

func take_damage():
	if Fullness == 2:
		play_transition("FullToHalf")
		Fullness = 1
		return
	if Fullness == 1:
		play_transition("HalfToEmpty")
		Fullness = 0
		return
	print("Empty heart took damage!?")
	

func heal():
	if Fullness == 1:
		$AnimatedSprite.play("FullToHalf", true)
		Fullness = 2
		return
	if Fullness == 0:
		$AnimatedSprite.play("HalfToEmpty", true)
		Fullness = 1
		return
	print("Full heart healing? error?")
	

func play_transition(var anim : String):
	$AnimatedSprite.play(anim)

func _on_AnimatedSprite_animation_finished():
	if Fullness == 2:
		$AnimatedSprite.play("Full")
		return
	if Fullness == 1:
		$AnimatedSprite.play("Half")
		return
	if Fullness == 0:
		$AnimatedSprite.play("Empty")
