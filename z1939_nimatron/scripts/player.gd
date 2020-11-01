extends Node


signal turn_off(line_index)
signal reset(line_index)
signal submit()
signal go_red()
signal go_green()


var my_turn : bool = true
var do_move : bool = false
var last_line_index : int = -1


func submit() -> void:
	if my_turn and do_move:
		emit_signal("submit")
		my_turn = false
#

func line_pressed(line_index : int) -> void:
	if not my_turn:
		return
	if line_index != last_line_index:
		if last_line_index < 0:
			print(last_line_index)
			last_line_index = line_index
		emit_signal("reset", last_line_index)
	last_line_index = line_index
	do_move = true
	emit_signal("go_green")
	emit_signal("turn_off", line_index)


func line_reset() -> void:
	do_move = false
	emit_signal("go_red")
#

func player_turn() -> void:
	my_turn = true
#
