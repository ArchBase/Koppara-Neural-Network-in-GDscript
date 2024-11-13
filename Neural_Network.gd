class_name Neural_Network

var layers:Array
var prev_loss = 0


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
	var loss_array = []
	
	for i in range(len(y_predicted)):
		loss_array.append(y[i] - y_predicted[i])
	
	var sum=0
	for each in loss_array:
		sum += each
	
	return sum/loss_array.size()
	
func _calculate_batch_loss(x_batch, y_batch):
	var loss = []
	
	for i in range(len(x_batch)):
		loss.append(_calculate_loss(x_batch[i], y_batch[i]))
	
	var sum=0
	for each in loss:
		sum += each
	
	return sum/loss.size()


		
	
func get_loss_on_batch(dataset:Dataset):
	var current_batch_loss = _calculate_batch_loss(dataset.x_batch, dataset.y_batch)
	return current_batch_loss

func _apply_random_variation(learning_rate):
	pass

func _apply_same_variation(learing_rate):
	pass

func _apply_saved_variation():
	pass

func _save_variation():
	pass

func _negate_saved_variation():
	pass

func train(epochs, learning_rate, dataset:Dataset):
	prev_loss = _calculate_batch_loss(dataset.x_batch, dataset.y_batch)
	_apply_random_variation(learning_rate)
	_save_variation()
	
	for i in range(epochs):
		_apply_saved_variation()
		var new_loss = _calculate_batch_loss(dataset.x_batch, dataset.y_batch)
		if new_loss < prev_loss:
			_save_variation()
			prev_loss = new_loss
		else:
			_apply_random_variation(learning_rate)
			_save_variation()
		
		
		
		
			
			
		
	
	
	
	
	
	
