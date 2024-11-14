extends Node2D

var nn = Neural_Network.new()
var dt = Dataset.new()
var tz = Word_Tokenizer.new()
var progress_meter = Progress_Meter.new()
var t_thread = Thread.new()
var bar:ProgressBar
var out = ""
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
	out = nn.train(100, 0.1, dt, progress_meter)
	print("Training finished")
	
func _process(delta):
	
	if progress_meter.done:
		progress_meter.done = false
		$CanvasLayer/CodeEdit.text = out
		$CanvasLayer/ask.show()
		$CanvasLayer/Label2.text = "Training complete"
	else:
		bar.max_value = progress_meter.total
		bar.value = progress_meter.int_progress
		$CanvasLayer/CodeEdit.text = progress_meter.log_text
		
		$CanvasLayer/CodeEdit.scroll_vertical = $CanvasLayer/CodeEdit.get_v_scroll_bar().max_value

func _exit_tree():
	t_thread.wait_to_finish()


# response generation section
func _find_index_from_probability_distribution(probability_distribution:Array):
	var index = 0
	var value = 0
	for i in range(len(probability_distribution)):
		if probability_distribution[i] > value:
			value = probability_distribution[i]
			index = i
	return index

func _on_ask_button_pressed():
	var text = $CanvasLayer/ask/LineEdit.text
	if text == "":
		$CanvasLayer/ask/LineEdit.text = "First type your query here."
		return
	var tokenized_array = tz.string_to_token_array(text)
	
	for i in range(int($CanvasLayer/ask/LineEdit2.text)):
		var y = nn.process_x(tokenized_array.slice(tokenized_array.size() - 5, tokenized_array.size()))
		var y_token = _find_index_from_probability_distribution(y)
		tokenized_array.append(y_token)
	
	$CanvasLayer/ask/CodeEdit2.text = tz.token_array_to_string(tokenized_array)	
	



