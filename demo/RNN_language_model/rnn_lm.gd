extends Node


func _ready():
	var nn = Neural_Network.new()
	var tz = Word_Tokenizer.new()
	
	tz.tokenize("Hello world. racing is so nice")
	tz.print_tokenized()
	print(tz.string_to_token_array("racing is nice"))
	print(tz.token_array_to_string(tz.string_to_token_array("racing is nice")))
	
