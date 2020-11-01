extends Node2D


func _ready() -> void:
	pass


func _input(_event : InputEvent) -> void:
	if Input.is_key_pressed(KEY_F11):
		if OS.window_fullscreen:
			OS.window_fullscreen = false
		else:
			OS.window_fullscreen = true
