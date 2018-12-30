extends KinematicBody2D

var velocity = Vector2(0,0);
var direction = constants.down;

func _ready():
	print(position)
	position = $"../Map/Position".global_position;
	$"../UI/Layer/Analogic".connect("get_motion", self, "move_player");
	pass
	
func _physics_process(delta):
	if direction == constants.up:
		$AnimationPlayer.play("upAnimation");
	elif direction == constants.down:
		$AnimationPlayer.play("downAnimation");
	elif direction == constants.left:
		$AnimationPlayer.play("leftAnimation");
	else:
		$AnimationPlayer.play("rightAnimation");
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
	# move_and_slide(velocity, Vector2(0,0));
	pass

func move_player(vector, new_direction):
	print(new_direction);
	velocity = vector;
	direction = new_direction
	pass