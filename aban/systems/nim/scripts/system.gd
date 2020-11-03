extends Node


var semaphore : Semaphore = Semaphore.new()
var mutex_datas : Mutex = Mutex.new()
var mutex_active : Mutex = Mutex.new()
var active : bool = true
# [[heaps, misere, output], ...]
var datas : Array = []


func process(_ud) -> void:
	var data : Array = []
	while true:
#		yield(get_tree().create_timer(.5), "timeout")
		
		
		
		mutex_datas.lock()
		if datas:
			data = datas[0]
			datas.erase(data)
			mutex_datas.unlock()
		else:
			mutex_datas.unlock()
			continue
		
		if data:
			OutputSystem.call_with_process(
				data[2],
				[Nim.play(data[0], data[1])]
				)
		
		
		mutex_active.lock()
		if not active:
			mutex_active.unlock()
			return
		mutex_active.unlock()
		pass
	pass
