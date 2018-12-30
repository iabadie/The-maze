extends Node2D

var time = 1000.0;
const TIME_MAX = 1000.0;
const TIME_TO_REST = 5;
signal no_more_light;
signal change_light;


func _ready():
	$Timer.start();
	pass

# Function to initialize scene behiviour
func start():
	$Timer.start();
	
func set_particles(value):
	var result = value/TIME_MAX;
	emit_signal("change_light", result)
	$FireParticles.scale = Vector2(result, result);

# Function to add torch time when player get a new torch
func add_light_time(timePlus):
	if time + timePlus > TIME_MAX:
		time = TIME_MAX;
	else:
		time += timePlus;
	set_particles(time)

func _on_Timer_timeout():
	time -= TIME_TO_REST;
	set_particles(time)
	if time <= 0:
		emit_signal("no_more_light", time);
		
		$Timer.stop();
