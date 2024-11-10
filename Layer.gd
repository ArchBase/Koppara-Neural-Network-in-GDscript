class_name Layer

var input_length:int = 0
var y:Array

func _init(input_length_arg:int):
	input_length = input_length_arg

func check_input_shape(x:Array):
	if len(x) > input_length:
		print("input shape error")
		return false
	return true
	


