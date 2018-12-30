extends KinematicBody2D

var velocity = Vector2(0,0);
var direction = constants.down;
var isPlaying = false;

func _ready():
	position = $"../Map/Position".global_position;
	$"../UI/Layer/Analogic".connect("get_motion", self, "move_player");
	$"../UI/Layer/TorchUI".connect("change_light", self, "change_light_ratio")



func _physics_process(delta):
	if velocity == Vector2(0,0):
		$AnimationPlayer.stop();
		isPlaying = false;
	elif !isPlaying:
		isPlaying = true;
		if direction == constants.up:
			$AnimationPlayer.play("upAnimation");
		elif direction == constants.down:
			$AnimationPlayer.play("downAnimation");
		elif direction == constants.left:
			$AnimationPlayer.play("leftAnimation");
		else:
			$AnimationPlayer.play("rightAnimation");

	move_and_slide(velocity)

func move_player(vector, new_direction):
	velocity = vector;
	direction = new_direction
	pass

func change_light_ratio (value):

	$Light2D.texture_scale=value*4


	


func _on_AnimationPlayer_animation_finished(anim_name):
	print("ASDASDASDASDASDASD")
	print(direction)
	$AnimationPlayer.stop();
	isPlaying= false;
	pass
