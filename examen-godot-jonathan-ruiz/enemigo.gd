extends CharacterBody2D

var 	velocidad = 40

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		
	velocity.x = - velocidad
	move_and_slide()
	
func _on_zona_mortal_body_entered(body):
	if body.is_in_group("jugador"):
		velocidad = velocidad * 2
