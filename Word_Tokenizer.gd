class_name Word_Tokenizer

var token_to_word:Dictionary
var word_to_token:Dictionary
var token_index = 0

func tokenize(s=""):
	s = s.split(" ")
	for each_word in s:
		if each_word in token_to_word.values():
			continue
		token_to_word[token_index] = each_word
		word_to_token[each_word] = token_index
		token_index += 1

func string_to_token_array(s=""):
	var token_array = []
	s = s.split(" ")
	for each_word in s:
		token_array.append(word_to_token[each_word])
	return token_array

func token_array_to_string(token_array:Array):
	var word_array = []
	for each_token in token_array:
		word_array.append(token_to_word[each_token])
	return " ".join(word_array)

func print_tokenized():
	print(word_to_token)

func read_from_file(file_path: String) -> String:
	var file = FileAccess.open(file_path, FileAccess.READ)  # Open the file for reading
	
	if file:
		var file_contents = file.get_as_text()  # Read the entire file as a string
		file.close()  # Always close the file after reading
		return file_contents
	else:
		print("Failed to open file")
		return ""




