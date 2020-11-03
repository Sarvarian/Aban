extends Button


var timer : float = 5
var end_timer : float = 50
var call_time : int = 0
var return_time : int = 0



func _physics_process(delta : float) -> void:
	if not timer < 0:
		do()
		timer -= delta


func _on_Button_pressed() -> void:
	print(call_time, " / ", return_time)

func do() -> void:
	var f : FuncRef = funcref(self, "res")
	for i in range(20):
		NimSystem.play(f, [i+1])
		call_time += 1

func _on_Button2_pressed():
	do()

func res(_r : PoolByteArray) -> void:
	print(_r[1])
	return_time += 1


