extends Sprite2D

var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func move(direction):
	global_position += direction

func triggerKey(key: String):
	match key:
		"A": 
			move(Vector2(-10, 0))
		"D":
			move(Vector2(10, 0))
		"W":
			move(Vector2(0, -10))
		"S": 
			move(Vector2(0, 10))	


func _input(event):
	print(event.as_text())
	if event is InputEventKey:
		triggerKey(event.as_text())
