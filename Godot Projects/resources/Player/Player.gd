extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 300
const FRICTION = 300

var velocity = Vector2.ZERO


func _physics_process(delta):
	
	var input_vec = Vector2.ZERO
	input_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vec = input_vec.normalized()
	
	if input_vec != Vector2.ZERO:
		velocity += input_vec * ACCELERATION * delta
	else:
		velocity = Vector2.ZERO
			
	move_and_collide(velocity * delta)
