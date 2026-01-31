extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var col_arriba: CollisionShape2D = $"../ColArriba"


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("tilemapArriba"):
		if global_position.y > 228:
			position.y -= 256
	if Input.is_action_just_pressed("tilemapAbajo"):
		if global_position.y < 540:
			position.y += 256
	if Input.is_action_just_pressed("tilemapDerecha"):
		if global_position.x < 540:
			position.x += 256
	if Input.is_action_just_pressed("tilemapIzquierda"):
		if global_position.x > 228:
			position.x -= 256
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
