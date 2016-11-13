
extends HBoxContainer

var len = settings.row_len
var bitNum = "0".pad_zeros(settings.row_len)
var curBitNum = "0".pad_zeros(settings.row_len)
var done = false

onready var root = get_node("..")
onready var DecNum = get_node("DecNum")
func _ready():
	#set_number(0)
	pass


func get_bit(bit):
	return bitNum[bit]

func set_number(number):
	bitNum = utils.numToStr(number, 2).pad_zeros(len)
	get_node("DecNum/Label").set_text(str(number))
	
func check_row():
	done = curBitNum == bitNum
	DecNum.set_pressed(done)
	
func _OnBitToggled(toggled, bit):
	var val = str(int(toggled))
	curBitNum[len - bit - 1] = val
	var col = int(get_name()[3])
	root.get_node("DecRow").curBitNum[bit][col] = val
	check_row()
	root.get_node("DecRow").check_col(bit)
	