extends Camera2D

# Set the initial camera position
func _ready():
	position = $"../../Character".global_position
	pass

# Update the camera position depending the Character position
func _process(delta):
	position = $"../../Character".global_position
