extends CharacterBody2D


const VELOCIDAD = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("salto") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * VELOCIDAD
	else:
		velocity.x = move_toward(velocity.x, 0, VELOCIDAD)

	move_and_slide()
