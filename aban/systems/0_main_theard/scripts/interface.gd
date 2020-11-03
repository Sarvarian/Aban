extends Node


func add_to_physics_process(function : FuncRef) -> void:
	if not $System.pp_functions.has(function):
		$System.pp_functions.append(function)


func add_to_process(function : FuncRef) -> void:
	if not $System.p_functions.has(function):
		$System.p_functions.append(function)


func remove_from_physics_process(function : FuncRef) -> void:
	if $System.pp_functions.has(function):
		$System.pp_functions.erase(function)


func remove_from_process(function : FuncRef) -> void:
	if $System.p_functions.has(function):
		$System.p_functions.erase(function)
