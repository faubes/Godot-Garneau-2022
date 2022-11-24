extends Node

func load_level(var i):
	var new_world = "res://Maps/World" + str(i) + ".tscn"
	var err = get_tree().change_scene(new_world)
	if err:
		print(err)


