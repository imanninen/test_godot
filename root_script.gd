extends Node2D

var field = []
# Called when the node enters the scene tree for the first time.
func _ready():
	init_field()
	var player_node = get_node("Player")
	var root_node = get_node(".")
	player_node.wants_to_move.connect(root_node._player_wants_to_move)

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
	
	
func _draw():
	print("We call draw!")
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
	
func move(pos):
	var player = get_node("Player")
	var pos_x: int = pos.x / 64
	var pos_y: int = pos.y / 64
	var current_pos_x_inx = int(player.global_position.x / 64)
	var current_pos_y_inx = int(player.global_position.y / 64)
	print(current_pos_x_inx, " ", current_pos_y_inx)
	if pos_x >= 10 or pos_y >= 10:
		print("Out of field!")
		return
	
	if (current_pos_x_inx != pos_x) and (current_pos_y_inx != pos_y):
		print("You are allowed to move only in one direction.") 
		return
	
	var new_current_cell: Cell = field[pos_x][pos_y]
	if new_current_cell != current_cell:
		move_player(player, pos_x, pos_y)
		current_cell = new_current_cell

func move_player(player, pos_x, pos_y):
	var i = pos_x
	var j = pos_y
	var current_pos_x_inx = int(player.global_position.x / 64)
	var current_pos_y_inx = int(player.global_position.y / 64)
	player.global_position = Vector2(pos_x * 64 + 32, pos_y * 64 + 32)
	cell_x = pos_x 
	cell_y = pos_y
	
	mark_cells(current_pos_x_inx, pos_x, current_pos_y_inx, pos_y)
	queue_redraw()

func mark_cells(orig_x: int, new_x: int, orig_y: int, new_y: int):
	for i in range(min(orig_x, new_x), max(orig_x, new_x)+ 1):
		for j in range(min(orig_y, new_y), max(orig_y, new_y) + 1):
			if i == orig_x and j == orig_y:
				continue
			field[i][j].is_touched = true	

func _player_wants_to_move(pos):
	move(pos)
	
	
class Cell:
	var is_touched: bool
	var id
	func _init(a, b):
		is_touched = a
		id = b
	
