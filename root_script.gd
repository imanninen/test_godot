extends Node2D

var field = []
# Called when the node enters the scene tree for the first time.
func _ready():
	init_field()

var current_cell: Cell
var cell_x = 0
var cell_y = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player: Node2D = get_node("Player")
	var position = player.global_position
	var position_x = int(position.x)
	var position_y = int(position.y)
	
	var pos_x_div = position_x / 64
	var pos_y_div = position_y / 64
	if pos_x_div >= 10 or pos_y_div >= 10:
		print("Out of field!")
		return
	var new_current_cell: Cell = field[pos_x_div][pos_y_div]
	if new_current_cell != current_cell:
		#print("Current cell id: " + new_current_cell.id)
		cell_x = pos_x_div
		cell_y = pos_y_div
		current_cell = new_current_cell
		field[pos_x_div][pos_y_div].is_touched = true
		queue_redraw()
	
func _draw():
	
	print(cell_x, cell_y)
	for i in range(10):
		for j in range(10):
			if field[i][j].is_touched:
				draw_rect(Rect2(i*64 + 1, j*64 + 1, 63, 63), Color.GREEN, false)
			else:
				draw_rect(Rect2(i*64 + 1, j*64 + 1, 63, 63), Color.RED, false)
				
func init_field():
	for i in range(10):
		var tmpArr = []
		for j in range(10):
			var tmpCell = Cell.new(false, str(i) + "-" + str(j))
			tmpArr.append(tmpCell)
		
		field.append(tmpArr)
	cell_x = 0
	cell_y = 0
	
class Cell:
	var is_touched: bool
	var id
	func _init(a, b):
		is_touched = a
		id = b
	
