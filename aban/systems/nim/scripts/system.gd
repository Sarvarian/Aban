extends Node


var semaphore : Semaphore = Semaphore.new()
var mutex_datas : Mutex = Mutex.new()
var mutex_active : Mutex = Mutex.new()
var active : bool = true
# [[heaps, misere, output], ...]
var datas : Array = []


func process(_ud) -> void:
	while true:
		
# warning-ignore:return_value_discarded
		semaphore.wait()
		print("from nimsys ", datas.size())
		
		mutex_datas.lock()
		for d in datas:
			mutex_datas.unlock()
			
#			d[2].call_func(Nim.play(d[0], d[1]))
			
			OutputSystem.call_with_process(
				d[2],
				[Nim.play(d[0], d[1])]
				)
			
			mutex_datas.lock()
			datas.erase(d)
			mutex_datas.unlock()
		mutex_datas.unlock()
		
		
		mutex_active.lock()
		if not active:
			mutex_active.unlock()
			return
		mutex_active.unlock()
		pass
	pass
