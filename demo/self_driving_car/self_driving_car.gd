extends Node

func _ready():
	var nn = Neural_Network.new()
	var dt = Dataset.new()
	
	nn.add_input_dense(5, 2, 'sig')
	nn.add_dense(2, 'sig')
	
	dt.set_x([[0, 0], [0, 1], [1, 0], [1, 1]])
	dt.set_y([[0, 0], [0, 1], [1, 0], [1, 1]])
	
	dt.set_batch_mode("no batch")
	
	print("model output before training: ", nn.process_x([0, 1]))
	
	var out = nn.train(10000, 0.01, dt)
	
	print("model output after training: ", nn.process_x([0, 1]))
	$CanvasLayer/CodeEdit.text = out
