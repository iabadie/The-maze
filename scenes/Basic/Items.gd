extends Area2D

export (String) var title = ""

export (String) var text = ""

export (String, "Key", "Torch") var SpriteText

export (String, "OPEN", "VISIBLE") var action


func _ready():
	$Sprite.texture = load("res://assets/items/" + SpriteText + ".png")
	pass

func GetAction():
	return action
	pass

func GetTitle():
	return title
	pass

func GetText():
	return text
	pass

func GetItem():
	var item = load("res://scripts/BasicItems.gd").new()
	item.TITLE = title
	item.TEXT = text
	item.ACTION = action
	item.SPRITE = SpriteText
	pass

func _process(delta):
	pass
