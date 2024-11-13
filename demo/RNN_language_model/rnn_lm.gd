extends Node


func _ready():
	var nn = Neural_Network.new()
	var tz = Word_Tokenizer.new()
	var dt = Dataset.new()
	
	var s = tz.read_from_file("res://Koppara-Neural-Network-in-GDscript/demo/RNN_language_model/rawdata.txt")
	print(s)
	
	tz.tokenize(s)
	tz.print_tokenized()
	var t = tz.string_to_token_array("Hello world. racing is so nice")
	print(t)
	dt.format_for_rnn(t, 2, 1)
	print(dt.x)
	print(dt.y)
	
	dt.set_batch_mode("no batch")
	
	nn.add_input_dense(2, 2, "relu")
	nn.add_dense(5, "relu")
	nn.add_dense(1, "relu")
	
	print(nn.get_loss_on_batch(dt))
	#print(nn.process_x(dt.x_batch[1]))
	#print(tz.string_to_token_array("racing is nice"))
	#print(tz.token_array_to_string(tz.string_to_token_array("racing is nice")))
	
