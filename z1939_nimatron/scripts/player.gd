extends Node


signal turn_off(line_index)
signal submit()
signal go_red()
signal go_green()


var my_turn : bool = true
var do_move : bool = false


func submit() -> void:
    if my_turn and do_move:
        emit_signal("submit")
        my_turn = false
#

func line0() -> void:
    emit_signal("turn_off", 0)
    do_move = true
    emit_signal("go_green")
#
func line1() -> void:
    emit_signal("turn_off", 1)
    do_move = true
    emit_signal("go_green")
#
func line2() -> void:
    emit_signal("turn_off", 2)
    do_move = true
    emit_signal("go_green")
#
func line3() -> void:
    emit_signal("turn_off", 3)
    do_move = true
    emit_signal("go_green")
#

func line_reset() -> void:
    do_move = false
    emit_signal("go_red")
#

func player_turn() -> void:
    my_turn = true
#