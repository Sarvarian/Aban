extends Button


var timer : float = 20


func _process(delta : float) -> void:
	get_node("../Label3").text = "delta: " + String(delta)
	if not timer < 0:
		get_node("../Label2").text = "timer: " + String(int(timer))
		timer -= delta
#	print(delta)


