class_name Dataset

var x:Array
var y:Array

var x_batch:Array
var y_batch:Array

func format_for_rnn(array, rnn_input_length:int, rnn_output_length:int):
	for i in range(len(array)-rnn_input_length):
		x.append(array.slice(i, i+rnn_input_length))
		y.append(array.slice(i+rnn_input_length, i+rnn_input_length+rnn_output_length))
	print("formated dataset for rnn")


