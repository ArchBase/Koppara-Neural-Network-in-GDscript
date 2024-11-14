extends Node2D

var nn = Neural_Network.new()
var dt = Dataset.new()
var tz = Word_Tokenizer.new()
var progress_meter = Progress_Meter.new()
var t_thread = Thread.new()
var bar:ProgressBar
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
	t_thread.start(train)
	bar = get_node("CanvasLayer/ProgressBar")
	bar.min_value = progress_meter.start
	bar.max_value = progress_meter.total
	var i
	
	


func train():
	print("Training started")
	var out = nn.train(5, 0.1, dt, progress_meter)
	print("Training finished")
	
func _process(delta):
	bar.max_value = progress_meter.total
	bar.value = progress_meter.int_progress

func _exit_tree():
	t_thread.wait_to_finish()
