class_name Progress_Meter

var int_progress = 0

var total = 0
var start = 0
var done = false
var log_text = ""

func set_progress(value):
	int_progress = value

func add_progress(value):
	int_progress += value
