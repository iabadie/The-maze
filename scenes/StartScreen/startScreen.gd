extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$start.play()




func _on_newGame_pressed():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")
	


func _on_exit_pressed():
	get_tree().quit()
