extends HBoxContainer

onready var root = get_node("..")
var curBitNum = []
var bitNum = []

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var tmp = "0".pad_zeros(settings.row_len)
	for i in range(settings.row_len):
		bitNum.push_back(tmp)
		curBitNum.push_back(tmp)
	pass

func check_col(col):
	get_node(str("Col",col)).set_pressed(curBitNum[col] == bitNum[col])
	
func set_bit(val, bit, row):
	bitNum[bit][row] = val
	
func set_cur_bit(val, bit, row):
	curBitNum[bit][row - settings.row_len] = val