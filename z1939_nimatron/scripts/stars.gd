extends Node2D


signal reset_game()


func _ready() -> void:
	$AnimationPlayer.play("Thinking")


func reset_finished() -> void:
	emit_signal("reset_game")
