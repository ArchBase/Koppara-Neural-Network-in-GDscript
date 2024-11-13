class_name Neuron

var config = {
	"max_weight_random_value": 10.0,
	"min_weigth_random_value": -10.0,
	"no_of_weights": 0,
	"activation":"relu"
}
var parameters = {
	"weight":[],
	"bias":0
}

var weight_variation = []
var bias_variation = 0
var restore_weight = []
var restore_bias = 0
var commit_weight = []
var commit_bias = 0

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

func apply_random_variation(learning_rate):
	weight_variation = []
	restore_weight = parameters["weight"]
	restore_bias = parameters["bias"]
	for i in range(len(parameters["weight"])):
		var variation = randf_range(-learning_rate, learning_rate)
		weight_variation.append(variation)
		parameters["weight"][i] += weight_variation[i]
	bias_variation = randf_range(-learning_rate, learning_rate)
	parameters["bias"] += bias_variation

func save_variation():
	return

func apply_saved_variation():
	restore_weight = parameters["weight"]
	restore_bias = parameters["bias"]
	for i in range(len(parameters["weight"])):
		parameters["weight"][i] += weight_variation[i]
	parameters["bias"] += bias_variation
	
func restore_weights(): 
	parameters["weights"] = restore_weight
	parameters["bias"] = restore_bias


func commit_weights():
	commit_weight = parameters["weight"].duplicate(true)
	commit_bias = parameters["bias"]

func restore_last_commit():
	parameters["weight"] = commit_weight.duplicate(true)
	parameters["bias"] = commit_bias

