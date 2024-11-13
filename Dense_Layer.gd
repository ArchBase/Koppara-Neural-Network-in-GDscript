class_name Dense_Layer extends Layer

var neurons = []
var no_of_neurons:int
var activation:String

func _init(input_length_arg:int, no_of_neurons_arg:int, activation_arg:String):
	super._init(input_length_arg)
	no_of_neurons = no_of_neurons_arg
	activation = activation_arg
	for i in range(no_of_neurons):
		neurons.append(Neuron.new(input_length, activation))

func process_x(x:Array):
	y = []
	if not check_input_shape(x):
		return
	for i in range(no_of_neurons):
		y.append(neurons[i].process_x(x))
	return y
	
func get_no_of_neurons():
	return no_of_neurons

func apply_random_variation(learning_rate):
	for i in range(len(neurons)):
		neurons[i].apply_random_variation(learning_rate)

func save_variation():
	for i in range(len(neurons)):
		neurons[i].save_variation()

func apply_saved_variation():
	for i in range(len(neurons)):
		neurons[i].apply_saved_variation()

func restore_weights():
	for i in range(len(neurons)):
		neurons[i].restore_weights()

func commit_weights():
	for i in range(len(neurons)):
		neurons[i].commit_weights()

func restore_last_commit():
	for i in range(len(neurons)):
		neurons[i].restore_last_commit()

