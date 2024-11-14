extends Node2D

var nn = Neural_Network.new()
var dt = Dataset.new()
var tz = Word_Tokenizer.new()
# Called when the node enters the scene tree for the first time.
func _ready():

	
	var text = tz.read_from_file("res://Koppara-Neural-Network-in-GDscript/demo/rnn_language_model/rawdata.txt")
	tz.tokenize(text)
	#print(tz.print_tokenized())
	#print(tz.token_index)
	
	nn.add_input_dense(5, 7, 'relu')
	nn.add_dense(7, 'relu')
	nn.add_dense(10, 'relu')
	nn.add_dense(tz.token_index, 'sig')
	
	dt.format_for_rnn(tz.string_to_token_array(text), 7, tz.token_index)
	dt.set_batch_mode("no batch")
	#print(dt.x_batch[0])
	#print(dt.y_batch[0])


func train():
	print("Training started")
	var out = nn.train(5, 0.1, dt)
	print("Training finished")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
