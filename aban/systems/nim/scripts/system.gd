extends Node


var semaphore : Semaphore = Semaphore.new()
var mutex_datas : Mutex = Mutex.new()
var mutex_active : Mutex = Mutex.new()
var active : bool = true
# [[heaps, misere, output], ...]
var datas : Array = []
var _datas_use : Array = []


func process(_ud) -> void:
	while true:
		
# warning-ignore:return_value_discarded
		semaphore.wait()
		
		mutex_datas.lock()
		for d in datas:
			_datas_use.append(d)
			datas.erase(d)
			mutex_datas.unlock()
		mutex_datas.unlock()
		
		for d in _datas_use:
			OutputSystem.call_with_process(
				d[2],
				[Nim.play(d[0], d[1])]
				)
			_datas_use.erase(d)
		
		
		mutex_active.lock()
		if not active:
			mutex_active.unlock()
			return
		mutex_active.unlock()
		pass
	pass
