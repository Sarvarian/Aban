extends Button


var timer : float = 5
var end_timer : float = 1
var call_time : int = 0
var return_time : int = 0


func _physics_process(_delta : float) -> void:
	_on_Button_pressed()
	return
#	if not timer < 0:
#		_on_Button_pressed()
#		timer -= delta
#	elif not end_timer < 0:
#		print(call_time, " / ", return_time)
#		end_timer -= delta


func _on_Button_pressed() -> void:
	var f : FuncRef = funcref(self, "res")
	NimSystem.play(f, [1])
	call_time += 1
	NimSystem.play(f, [2])
	call_time += 1
	NimSystem.play(f, [3])
	call_time += 1
	NimSystem.play(f, [4])
	call_time += 1
	pass # Replace with function body.

func res(r : PoolByteArray) -> void:
#	print(r[1])
	return_time += 1
