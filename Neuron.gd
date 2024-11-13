class_name Neuron

var config = {
	"max_weight_random_value": 5.0,
	"min_weigth_random_value": -5.0,
	"no_of_weights": 0,
	"activation":"relu"
}
var parameters = {
	"weight":[],
	"bias":0
}

func relu(x):
	return max(0.0, x)
	
func sigmoid(x):
	return 1 / (1 + exp(-x))

	
func _init(no_of_weights:int, activation:String):
	config['activation'] = activation
	config["no_of_weights"] = no_of_weights
	for i in range(no_of_weights):
		parameters['weight'].append(randf_range(config["min_weigth_random_value"], config["max_weight_random_value"]))
	parameters['bias'] = randf_range(config["min_weigth_random_value"], config["max_weight_random_value"])

func process_x(x:Array):
	if len(x) > config["no_of_weights"]:
		print("no of inputs must be greater or equal no of weights")
		return null
	var result = 0
	for i in range(len(x)): # loop to calculate and add weighted sum
		result += x[i] * parameters['weight'][i]
	result += parameters['bias']
	match config['activation']:
		"relu":
			result = relu(result)
		"sig":
			result = sigmoid(result)
	return result

