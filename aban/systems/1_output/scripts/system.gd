extends Node


var mutex : Mutex = Mutex.new()

# [[funcref, array_of_params], ...]
var outputs_in : Array = []
var outputs_use : Array = []

func _process(_delta : float) -> void:
	
	mutex.lock()
	for o in outputs_in:
		outputs_use.append(o)
		outputs_in.erase(o)
	mutex.unlock()
	
	for o in outputs_use:
		if o[0].is_valid():
			call_deferred("function_call", o)
		outputs_use.erase(o)


func function_call(output : Array):
	output[0].call_funcv(output[1])
