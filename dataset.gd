class_name Dataset

var x:Array
var y:Array

var x_batch:Array
var y_batch:Array
	

func format_for_rnn(array, rnn_input_length:int, token_index:int):
	for i in range(len(array)-rnn_input_length):
		x.append(array.slice(i, i+rnn_input_length))
		
		var y_token = i+rnn_input_length
		var y_p = []
		for j in range(token_index):
			if j == y_token:
				y_p.append(1)
			else:
				y_p.append(0)
		
		y.append(y_p)
		#y.append(array.slice(i+rnn_input_length, i+rnn_input_length+rnn_output_length))
	print("formated dataset for rnn")


func set_batch_mode(s:String):
	match s:
		"no batch":
			x_batch = x
			y_batch = y

func read_from_file(file_path: String) -> String:
	var file = FileAccess.open(file_path, FileAccess.READ)  # Open the file for reading
	
	if file:
		var file_contents = file.get_as_text()  # Read the entire file as a string
		file.close()  # Always close the file after reading
		return file_contents
	else:
		print("Failed to open file")
		return ""

func load_array_from_file(file_name: String) -> Array:
	# Assuming you have a function that reads the content of the file as a string.
	var file_content = read_from_file(file_name)  # replace with your actual function
	print(file_content)
	# Parse the content as JSON
	var result = JSON.new().parse(file_content)
	print(result.ty)
	if result.error == OK:
		return result.result  # return the parsed array
	else:
		print("Error parsing JSON:", result.error_string)
		return []

func set_x(array):
	x = array
func set_y(array):
	y = array
	
	
