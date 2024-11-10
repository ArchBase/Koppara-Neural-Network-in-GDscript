class_name Word_Tokenizer

var token_to_word:Dictionary
var word_to_token:Dictionary
var token_index = 0

func tokenize(s=""):
	s = s.split(" ")
	for each_word in s:
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


