extends Node2D


func go_red() -> void:
	$AnimationPlayer.play("Red")
#

func go_green() -> void:
	$AnimationPlayer.play("Green")
#

func pressed() -> void:
	modulate.v = .5
#

func released() -> void:
	modulate.v = 1
#
