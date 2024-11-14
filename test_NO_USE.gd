extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	var last_five_elements = array.slice(array.size() - 5, array.size())
	print(last_five_elements) # Output: [6, 7, 8, 9, 10]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
