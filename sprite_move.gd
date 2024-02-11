extends Sprite2D

var speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tmp = get_input()
	global_position += tmp
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	var velocity = input_direction * speed
	print(velocity)
	return velocity
	
#func move(direction):
	#global_position += direction
#
#func triggerKey(key: String):
	#match key:
		#"A": 
			#move(Vector2(-10, 0))
		#"D":
			#move(Vector2(10, 0))
		#"W":
			#move(Vector2(0, -10))
		#"S": 
			#move(Vector2(0, 10))	
#
#
#func _input(event):
	#print(event.as_text())
	#if event is InputEventKey:
		#triggerKey(event.as_text())
