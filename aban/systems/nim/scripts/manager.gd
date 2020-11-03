extends Node


var thread : Thread = Thread.new()


func _ready() -> void:
	if thread.start(get_node("../System"), "process"):
		if OS.is_debug_build():
			print("NimSystem thread start failed!")


func _exit_tree() -> void:
	if thread.is_active():
		get_node("../System").mutex_active.lock()
		get_node("../System").active = false
		get_node("../System").mutex_active.unlock()
		get_node("../System").semaphore.post()
		thread.wait_to_finish()
