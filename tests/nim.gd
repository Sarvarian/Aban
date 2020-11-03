extends Button


var timer : float = 20
var end_timer : float = 50
var call_time : int = 0
var return_time : int = 0



func _process(delta : float) -> void:
	get_node("../Label3").text = "delta: " + String(delta)
	if not timer < 0:
		get_node("../Label2").text = "timer: " + String(timer)
		do()
		timer -= delta
#	print(delta)


func _on_Button_pressed() -> void:
	print(call_time, " / ", return_time)

func do() -> void:
	var f : FuncRef = funcref(self, "res")
	for i in range(500):
#		NimSystem.play(f, [i+1])
		call_deferred("res", Nim.play([i+1]))
		call_time += 1

func _on_Button2_pressed():
	do()

func res(_r : PoolByteArray) -> void:
#	print(_r[1])
	return_time += 1


