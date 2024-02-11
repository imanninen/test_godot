extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move(direction: String):
	pass

func triggerKey(key: String):
	match key:
		"a": 
			move("left")
		"d":
			move("right")
		"w":
			move("up")
		"s": 
			move("down")	


func _input(event):
	if event is InputEventKey:
		triggerKey(event.as_text())
