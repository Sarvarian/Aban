extends Node


var thread : Thread = Thread.new()
onready var system : Node = get_node("../System")


func _ready() -> void:
	if thread.start(system, "process"):
		if OS.is_debug_build():
			print("NimSystem thread start failed!")


func _physics_process(_delta : float) -> void:
	pass


func _exit_tree() -> void:
	if thread.is_active():
		system.mutex_active.lock()
		system.active = false
		system.mutex_active.unlock()
		system.semaphore.post()
		thread.wait_to_finish()


func _on_Timer_timeout():
	pass
