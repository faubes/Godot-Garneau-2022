extends Sprite

onready var coin = preload("res://Items/Coin.tscn")

var coin_count = 0
export var max_coins = 15

func _on_Timer_timeout():
	if (get_children().size() < max_coins):
		var new_coin = coin.instance()
		new_coin.position = position + Vector2(rand_range(0,2), rand_range(0,2))
		new_coin.set_as_toplevel(true)
		add_child(new_coin)
	$Timer.start()
