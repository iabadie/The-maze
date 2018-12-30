extends Control

var item = null

func _ready():
	pass

func InitItem(var TItem):
	item = TItem
	
	$Sprite.texture = load("res://assets/items/" + item.SPRITE + ".png")
	$Label.text = item.TITLE
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
