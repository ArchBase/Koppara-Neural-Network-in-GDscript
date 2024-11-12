class_name Neural_Network

var layers:Array


func _init():
	pass
	
func add_layer(layer:Dense_Layer):
	layers.append(layer)

func add_input_dense(no_of_neurons:int, input_length:int, activation:String):
	layers.append(Dense_Layer.new(input_length, no_of_neurons, activation))

func add_dense(no_of_neurons:int, activation:String):
	layers.append(Dense_Layer.new(layers[-1].get_no_of_neurons(), no_of_neurons, activation))
	

func process_x(x_arg:Array):
	var x = x_arg.duplicate(true)
	for i in range(len(layers)):
		x = layers[i].process_x(x)
	return x

func _calculate_loss(x, y):
	var y_predicted = process_x(x)
	var loss_array
	
	for i in range(len(y_predicted)):
		loss_array.append(y[i] - y_predicted[i])
	return loss_array
	
func _calculate_batch_loss_avg_array(x_batch, y_batch):
	var avg_loss = []
	avg_loss.resize(len(y_batch[0]))
	for i in range(len(avg_loss)):
		avg_loss[i] = 0
		
	for i in range(len(x_batch)):
		var loss = _calculate_loss(x_batch[i], y_batch[i])
		for j in range(len(loss)):
			avg_loss[j] += loss[j]
	
	for i in range(len(x_batch)):
		avg_loss[i] = avg_loss[i] / len(x_batch)
	
	return avg_loss


		
	
func train(dataset:Dataset):
	var current_batch_loss = _calculate_batch_loss_avg_array(dataset.x_batch, dataset.y_batch)
