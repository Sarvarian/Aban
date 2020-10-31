extends Sprite


var is_on : bool = true setget ,get_is_on


func on() -> void:
	modulate.h = 1
	is_on = true
	pass


func off() -> void:
	modulate.h = .5
	is_on = false
	pass


func get_is_on() -> bool:
	return is_on