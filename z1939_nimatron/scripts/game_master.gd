extends Node


var lights : PoolIntArray = []


func _ready() -> void:
	for lb in get_tree().get_nodes_in_group("light_bulbs"):
		lights.append((lb as Object).get_instance_id())

