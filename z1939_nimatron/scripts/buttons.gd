extends Node2D


signal line_pressed(line_index)


var lines_mouse_in : PoolByteArray = [false, false, false, false]


func _ready() -> void:
# warning-ignore:return_value_discarded
	$Line0.connect("mouse_entered", self, "mouse_entered", [0, true])
# warning-ignore:return_value_discarded
	$Line0.connect("mouse_exited", self, "mouse_entered", [0, false])
# warning-ignore:return_value_discarded
	$Line1.connect("mouse_entered", self, "mouse_entered", [1, true])
# warning-ignore:return_value_discarded
	$Line1.connect("mouse_exited", self, "mouse_entered", [1, false])
# warning-ignore:return_value_discarded
	$Line2.connect("mouse_entered", self, "mouse_entered", [2, true])
# warning-ignore:return_value_discarded
	$Line2.connect("mouse_exited", self, "mouse_entered", [2, false])
# warning-ignore:return_value_discarded
	$Line3.connect("mouse_entered", self, "mouse_entered", [3, true])
# warning-ignore:return_value_discarded
	$Line3.connect("mouse_exited", self, "mouse_entered", [3, false])
#

func mouse_entered(line_index : int, is_in : bool) -> void:
	lines_mouse_in[line_index] = is_in
#

func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		for i in lines_mouse_in.size():
			if lines_mouse_in[i]:
				emit_signal("line_pressed", i)
				return

				
