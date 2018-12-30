extends Node

var Items = []
var MAXITEM = 8

func _ready():
	var item = load("res://scripts/BasicItems.gd").new()
	item.TITLE = "Key"
	item.TEXT = "Key Desc"
	item.ACTION = "OPEN"
	item.SPRITE = "key"
	Items.append(item)
	pass

func AddItem(var item):
	if(Items.size() < MAXITEM):
		Items.append(item)
		return true
	return false

func ItemSize():
	return Items.size()

func GetItemAction(var Act):
	for i in range(Items.size()-1):
		if(Items[i].ACTION == Act):
			return Items[i]
			pass
		pass
	return null

func GetIndexAction(var Act):
	for i in range(Items.size()-1):
		if(Items[i].ACTION == Act):
			return i
			pass
		pass
	return -1
	pass

func RemoveItem(var index):
	if(index >= 0 and index < Items.size()):
		Items.remove(index)
		return true
		pass
	return false
	pass

func GetItem(var index):
	if(index >= 0 and index < Items.size()):
		return Items[index]
		pass
	return null

func GetItems():
	return Items
	pass