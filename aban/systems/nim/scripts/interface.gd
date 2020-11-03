extends Node


func play(
	output : FuncRef,
	heaps : PoolByteArray,
	misere : bool = false
	) -> void:
	
	var data : Array = []
	
	data.append(heaps)
	data.append(misere)
	data.append(output)
	
	$System.mutex_datas.lock()
	$System.datas.append(data)
	$System.mutex_datas.unlock()
	
	pass
