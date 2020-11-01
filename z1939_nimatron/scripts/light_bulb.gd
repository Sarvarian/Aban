extends Sprite


var is_on : bool = true setget ,get_is_on


func on() -> void:
	modulate.v = 1
	is_on = true
	pass


func off() -> void:
	modulate.v = .5
	is_on = false
	pass


func get_is_on() -> bool:
	return is_on
