extends Node


var pp_functions : Array = [] # _physics_process
var p_functions : Array = [] # _process


func _physics_process(delta : float) -> void:
	for f in pp_functions:
		if f is FuncRef and f.is_valid():
			f.call_func(delta)


func _process(delta : float) -> void:
	for f in p_functions:
		if f is FuncRef and f.is_valid():
			f.call_func(delta)
