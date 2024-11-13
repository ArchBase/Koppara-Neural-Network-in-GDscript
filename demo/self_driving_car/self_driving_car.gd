extends Node

var train_thread:Thread
var nn
var dt
var out
var edit_text:CodeEdit

signal train_complete

func train():
	print("model output before training: ", nn.process_x([1, 1]))
	
	out = nn.train(10000, 0.01, dt)
	edit_text.text = out
	print("training complete")
	print("model output after training: ", nn.process_x([1, 1]))
	emit_signal("train_complete")

func _ready():
	edit_text = get_node("CanvasLayer/CodeEdit")
	nn = Neural_Network.new()
	dt = Dataset.new()
	
	train_thread = Thread.new()
	
	nn.add_input_dense(5, 2, 'sig')
	nn.add_dense(2, 'sig')
	
	dt.set_x([[0, 0], [0, 1], [1, 0], [1, 1]])# each pair are int format [left, right] if left is 0 it means car's front left raycas
	dt.set_y([[0, 0], [0, 1], [1, 0], [1, 1]])# each pair means whether the car should turn left or right
	
	dt.set_batch_mode("no batch")
	train_thread.start(train)



func _exit_tree():
	train_thread.wait_to_finish()
	




func _on_train_complete():
	$CanvasLayer/CodeEdit.text = out
