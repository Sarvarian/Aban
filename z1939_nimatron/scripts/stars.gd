extends Node2D


signal reset_game()
signal thinking_finished()


var thinking_time : float = 0


func _ready() -> void:
	$AnimationPlayer.play("Thinking")


func _process(delta : float) -> void:
	if not $AnimationPlayer.current_animation == "Thinking":
		return
	if thinking_time < 0:
		$AnimationPlayer.get_animation("Thinking").loop = false
	thinking_time -= delta


func start_thinking(time : float) -> void:
	thinking_time = time
	$AnimationPlayer.get_animation("Thinking").loop = true
	$AnimationPlayer.play("Thinking")


func initiate_reset() -> void:
	$AnimationPlayer.play("Reset")


func stop_reset() -> void:
	if $AnimationPlayer.current_animation == "Reset":
		$AnimationPlayer.stop(true)


func animation_finished(anim_name : String):
	if anim_name == "Thinking":
		emit_signal("thinking_finished")
	
	elif anim_name == "Reset":
		emit_signal("reset_game")
