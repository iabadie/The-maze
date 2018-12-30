extends Node2D

const pi = 3.1415;
const pi4 = pi/4;
const pi_3_4 = (pi * 3) / 4

var touched = false
var direction = constants.down;
const max_ration_length = 40;
var btnRect = null;
signal get_motion;

func _ready():
	# define the analogic area to considerate touch
	btnRect = Rect2(Vector2(self.global_position.x - 125, self.global_position.y - 125), Vector2(250, 250));
	
	

func _process(delta):
	if touched == true:
		if Input.is_action_just_released("touch"):
			touched = false
		else:
			# clamp devuelve el mismo vector pero reducido para que su
			# distancia sea de max_ration_length
			var new_position = get_local_mouse_position().clamped(max_ration_length)
			$boton.position = new_position
			var angle = new_position.angle();
			if angle <= pi_3_4 && angle >= pi4:
				direction = constants.down;
			elif angle >= -pi_3_4 && angle <= -pi4:
				direction = constants.up;
			elif angle >= -pi4 && angle <= pi4:
				direction = constants.right;
			else:
				direction = constants.left;
			
			# Emite una señal enviando la nueva posición ( clampeada ) para ser utilizada luego por el personaje
			# Ademas envía el vector proyectado al eje correspondiente dependiendod el angulo del mismo (arriba, abajo, izquierda, derecha)
			emit_signal("get_motion", new_position * 7, direction);
	elif $boton.position != $center.position:
		# Si no esta presionado y el botón no está centrado, lo centra
		$boton.position = $center.position
		# Emite la misma señal que antes pero con la posición 0,0
		emit_signal("get_motion", $center.position, direction)
	

# This 2 functions detect when user press into an analogic area
# And turn on the touched var.
func _input(event):
    if event is InputEventMouseButton: # If event is mouse click
        # Get click position
        var clickPos = Vector2(event.position.x, event.position.y)

        # If event is pressed and position belongs to btnRect
        if event.pressed && btnRect.has_point(clickPos) && touched == false:
            touched = true

func _on_touch_area_input_event( viewport, event, shape_idx ):
	if event.is_action_pressed("touch") && touched == false:
		touched = true
