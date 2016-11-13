
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

onready var Rows = get_node("Rows")
onready var DecRow = Rows.get_node("DecRow")
onready var Time = Rows.get_node("Header/Time")

func _ready():
	randomize()
	for i in range(settings.row_len):
		var row = Rows.get_node(str("Row",i))
		var num = randi()%int(pow(2, settings.row_len))
		row.set_number(num)
		for j in range(settings.row_len):
			DecRow.bitNum[settings.row_len - j - 1][i] = row.bitNum[j]
	for i in range(settings.row_len):
		var val = utils.binStrToInt(DecRow.bitNum[i]);
		DecRow.get_node(str("Col", i, "/Label")).set_text(str(val))
		Rows.get_node(str("Row",i)).check_row()
		DecRow.check_col(i)
		
	set_process(true)
	
var time = 0.0
var done = false
func _process(delta):
	var doneCount = 0
	
	Time.set_text("%.2f" % time)
	if done == false:
		for i in range(settings.row_len):
			doneCount += Rows.get_node(str("Row",i)).done
		if doneCount != settings.row_len:
			time += delta
		else:
			done = true
			pre_win()
	else:
		win(delta)
		
func pre_win():
	#for i in range(settings.row_len):
	#	var row = Rows.get_node(str("Row",i))
	#	for j in range(settings.row_len):
	pass
	
func win(delta):
	randomize()
	var r = randi()%settings.row_len
	var c = randi()%settings.row_len
	var v = randi()%2
	Rows.get_node(str("Row",r)).get_node(str("Bit", c)).set_pressed(v)

func _on_Button_pressed():
	get_tree().reload_current_scene()
