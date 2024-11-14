class_name Neural_Network

var layers:Array
var prev_loss = 0
var negate_count_threshold = 1

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
		loss_array.append(pow(y[i] - y_predicted[i], 2))
	
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
	for i in range(len(layers)):
		layers[i].apply_random_variation(learning_rate)

func _apply_saved_variation():
	for i in range(len(layers)):
		layers[i].apply_saved_variation()

func _save_variation():
	for i in range(len(layers)):
		layers[i].save_variation()

func _restore_previous_weights():
	for i in range(len(layers)):
		layers[i].restore_weights()

func _commit_weights():
	for i in range(len(layers)):
		layers[i].commit_weights()

func _restore_last_commit():
	for i in range(len(layers)):
		layers[i].restore_last_commit()
		

func _negate_and_apply_last_gradient(learning_rate):
	for i in range(len(layers)):
		layers[i]._negate_and_apply_last_gradient(learning_rate)



func train(epochs, learning_rate, dataset:Dataset, progress_meter:Progress_Meter=null):
	if progress_meter == null:
		progress_meter = Progress_Meter.new()
	progress_meter.total = epochs + 1
	progress_meter.start = 0
	progress_meter.set_progress(1)
	progress_meter.add_progress(0.1)
	prev_loss = _calculate_batch_loss(dataset.x_batch, dataset.y_batch)
	progress_meter.add_progress(0.2)
	_apply_random_variation(learning_rate)
	progress_meter.add_progress(0.3)
	_save_variation()
	progress_meter.add_progress(0.2)
	_commit_weights()
	progress_meter.add_progress(0.2)
	
	var output = ""
	var have_improved = false
	var negate_count = 0
	var out = " Training started"
	
	
	for i in range(epochs):
		progress_meter.log_text = output
		progress_meter.set_progress(i+1)
		output += out + "\n"
		out = "epochs: " + str(i)
		#progress_meter.set_progress(i+1)
		progress_meter.add_progress(0.1)
		_apply_saved_variation()
		progress_meter.add_progress(0.3)
		var new_loss = _calculate_batch_loss(dataset.x_batch, dataset.y_batch)
		progress_meter.add_progress(0.3)
		out += " new_loss: " + str(new_loss)
		#print(new_loss)
		if new_loss < prev_loss:
			negate_count = 0
			have_improved = true
			out += " improving✅, weight: "
			out += str(layers[0].neurons[0].parameters["weight"][0])
			_save_variation()
			prev_loss = new_loss
			_commit_weights()
			progress_meter.add_progress(0.3)
		elif have_improved == true:
			negate_count = 0
			out += " not improving❌, restoring to: "
			#_restore_previous_weights()
			_restore_last_commit()
			out += str(layers[0].neurons[0].parameters["weight"][0])
			_apply_random_variation(learning_rate)
			have_improved = false
			_save_variation()
			out += " generated new random variation🆕"
			progress_meter.add_progress(0.3)
		else:
			if negate_count > negate_count_threshold:
				out += " detected infinity negation loop,🚫"
				have_improved = true
				out += " will generate another random gradient"
				progress_meter.add_progress(0.3)
				continue
			out += " not improving❌, restoring to: "
			_restore_last_commit()
			out += str(layers[0].neurons[0].parameters["weight"][0])
			_negate_and_apply_last_gradient(learning_rate)
			negate_count += 1
			have_improved = false
			_save_variation()
			out += " negated current variation➖"
			progress_meter.add_progress(0.3)
		
			
	_restore_last_commit()
	output += "\n\nbest loss: " + str(_calculate_batch_loss(dataset.x_batch, dataset.y_batch))
	progress_meter.done = true
	return output
			
		
		
func show_multiple_loss(epochs, learning_rate, dataset:Dataset):
	for i in range(epochs):
		_apply_random_variation(learning_rate)
		print(_calculate_batch_loss(dataset.x_batch, dataset.y_batch))
		print("model output: %d", [process_x(dataset.x_batch[0])[0]])
		#print(layers[0].neurons[0].parameters["weight"], layers[0].neurons[1].parameters["weight"])
		
		
			
			
		
	
	
	
	
	
	
