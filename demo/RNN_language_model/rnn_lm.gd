extends Node


func _ready():
	var nn = Neural_Network.new()
	var tz = Word_Tokenizer.new()
	var dt = Dataset.new()
	
	var s = tz.read_from_file("res://Koppara-Neural-Network-in-GDscript/demo/RNN_language_model/rawdata.txt")
	#print(s)
	
	tz.tokenize(s)
	#tz.print_tokenized()
	print(tz.token_index)
	var t = tz.string_to_token_array("Hello world. racing is so nice")
	#print(t)
	dt.format_for_rnn(t, 5, 1)
	#print(dt.x)
	#print(dt.y)
	
	dt.set_batch_mode("no batch")
	
	nn.add_input_dense(7, 5, "relu")
	nn.add_dense(5, "relu")
	nn.add_dense(1, "sig")
	#nn.train(100, 0.1, dt)
	
	nn.show_multiple_loss(100, 10, dt)

	#print(nn.process_x(dt.x_batch[1]))
	#print(tz.string_to_token_array("racing is nice"))
	#print(tz.token_array_to_string(tz.string_to_token_array("racing is nice")))
	
