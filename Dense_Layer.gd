class_name Dense_Layer

var input_length:int = 0
var neurons = []
var no_of_neurons:int
var activation:String
var y:Array

func _init(input_length_arg:int, no_of_neurons_arg:int, activation_arg:String):
	input_length = input_length_arg
	no_of_neurons = no_of_neurons_arg
	activation = activation_arg
	for i in range(no_of_neurons):
		neurons.append(Neuron.new(input_length, activation))

func process_x(x:Array):
	y = []
	if len(x) > input_length:
		print("input shape error")
		return
	for i in range(no_of_neurons):
		y.append(neurons[i].process_x(x))
	return y
	


