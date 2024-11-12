class_name Dataset

var x:Array
var y:Array

var x_batch:Array
var y_batch:Array

func format_for_rnn(x, rnn_input_length:int):
	for i in range(len(x)-rnn_input_length-1):
		x.append(x.slice(i, i+rnn_input_length))
		y.append(x[i+rnn_input_length+1])
	print("formated dataset for rnn")


