class_name Model

var layers:Array


func _init():
	pass
	
func add(layer:Dense_Layer):
	layers.append(layer)
	

func process_x(x_arg:Array):
	var x = x_arg.duplicate(true)
	for i in range(len(layers)):
		x = layers[i].process_x(x)
	return x

