extends Node


func call_with_process(
	function : FuncRef,
	params : Array
	) -> void:
	
	var out : Array = [function, params]
	
	$System.mutex.lock()
	$System.outputs_in.append(out)
	$System.mutex.unlock()
	
	pass










