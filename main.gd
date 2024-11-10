extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var nn = Neural_Network.new()
	
	nn.add_input_dense(5, 2, 'relu')
	nn.add_dense(3, 'relu')
	nn.add_dense(6, 'relu')
	
	print(nn.process_x([0,1]))
