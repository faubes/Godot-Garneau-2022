extends Sprite

export(PackedScene) onready var thing

var coin_count = 0
export var max_things = 15

func _on_Timer_timeout():
	if not thing:
		print("Maker can't make nothing!")
		return
	if (get_children().size() < max_things):
		var new_thing = thing.instance()
		new_thing.position = position + Vector2(rand_range(0,2), rand_range(0,2))
		new_thing.position += 2 *Vector2.UP
		new_thing.set_as_toplevel(true)
		var body = new_thing as RigidBody2D
		if body:
			body.apply_impulse(Vector2.ZERO, 150*Vector2.UP)
		add_child(new_thing)
	$Timer.start()
