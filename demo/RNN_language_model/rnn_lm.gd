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
	#print(tz.string_to_token_array("racing is nice"))
	#print(tz.token_array_to_string(tz.string_to_token_array("racing is nice")))
	
