extends Node2D

var items = null

func _ready():
	LoadItems()
	pass

func ResetItems():
	for i in range($Panel/GridItems.get_child_count()):
		$Panel/GridItems.remove_child($Panel/GridItems.get_child(i))
		pass
	pass

func LoadItems():
	items = null
	ResetItems()
	items = PlayerData.GetItems()
	for i in range(items.size()):
		var item = load("res://scenes/GUI/Items.tscn")
		item = item.instance()
		$Panel/GridItems.add_child(item)
		pass
	pass

func _process(delta):
	pass
