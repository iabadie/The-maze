extends Camera2D

func _ready():
	position = $"../../Character".global_position
	pass

func _process(delta):
	position = $"../../Character".global_position
