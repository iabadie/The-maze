extends KinematicBody2D

var velocity = Vector2(0,0);
var direction = constants.down;
var isPlaying = false;
var animation = null;

const MAX_LIGHT_RATION = 4;

func _ready():
	# Set the initial light ratio
	$Light2D.texture_scale = MAX_LIGHT_RATION;
	# Set the initial character position using the current map position setted.
	position = $"../Map/Position".global_position;
	# Connect the character to receive signals from Analogic and Torch UI.
	$"../UI/Layer/Analogic".connect("get_motion", self, "move_player");
	$"../UI/Layer/TorchUI".connect("change_light", self, "change_light_ratio")



func _physics_process(delta):
	# 1) Detect the user direction and store the corresponding animation Name.
	var selectedAnimation;
	if direction == constants.up:
		selectedAnimation = "upAnimation";
	elif direction == constants.down:
		selectedAnimation = "downAnimation";
	elif direction == constants.left:
		selectedAnimation = "leftAnimation";
	else:
		selectedAnimation = "rightAnimation";
	# (1) ---
	
	# (2) If animation is no t playing or the animation resulted of (1) is different to the current
	# turn on the isPlaying, play the selected and store the selected on the animation var.
	if !isPlaying || selectedAnimation != animation:
		isPlaying = true;
		$AnimationPlayer.play(selectedAnimation);
		animation = selectedAnimation
	# (2) ---
	
	# (3) At the end, if the user stop moving, stop the animator and turn off the isPlaying
	if velocity == Vector2(0,0):
		$AnimationPlayer.stop();
		isPlaying = false;
	# (3) ---
	
	# Function from the Kinematic body to move the player/character belong the velocity vector.
	# If detect a collision, stop moving applying a slice with normal vector.
	move_and_slide(velocity)


# This function is called when receive the signal from the analogic.
# Store the velocity vector and the new direction enum (0,1,2 or 3)
func move_player(vector, new_direction):
	velocity = vector;
	direction = new_direction
	pass

# Change the ratio of the character light.
func change_light_ratio (value):
	# value is between 0 and 1. 1 is full ratio and 0 is totally black
	$Light2D.texture_scale = MAX_LIGHT_RATION * value;


func _on_AnimationPlayer_animation_finished(anim_name):
	isPlaying= false;
	pass
