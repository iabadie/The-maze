extends TouchScreenButton

var active = false

func _ready():
	pass


func _on_Bag_pressed():
	if !active :
		$Inventary.LoadItems()
		$Inventary.visible = true
		active = true
	else:
		$Inventary.visible = false
		active = false
	pass
