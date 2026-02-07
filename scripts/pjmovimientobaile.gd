extends CharacterBody2D

@onready var bailando = get_node("res://scenes/minijuego_baile.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var col_arriba: CollisionShape2D = $"../ColArriba"
@onready var p_jbaile: CharacterBody2D = %PJbaile
@onready var pisada: AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var pisoton: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var error: AnimationPlayer = $Error
signal noTeMuevas
@onready var pasos: Sprite2D = $Pasos
var twoStep: float
var moverse:bool = false
func _ready() -> void:
	$Pasos.position = Vector2(0.0, -pasos.get_rect().size.x*(3.0/10.0))
	#pasos.get_rect().size.x*(3/10)
	print(str($Pasos.position))
	print(str(pasos.get_rect().size.x*(3.0/10.0)))

	twoStep = ((1.0/15.0)+1.0)*pasos.get_rect().size.x*$Pasos.scale.x*%PJbaile.scale.x


func _physics_process(delta: float) -> void:
	#print(str(((1.0/15.0)+1.0)*pasos.get_rect().size.x*$Pasos.scale.x*%PJbaile.scale.x))

	if DialogoController.puedes_moverte_don_jugador:
		if p_jbaile.visible == true:
			if Input.is_action_just_pressed("tilemapArriba"):
				if global_position.y > 300 && moverse:
					position.y -= twoStep
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					$ErrorPolvo.visible = true
					$ErrorPolvo.play()
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("tilemapAbajo"):
				if global_position.y < 580 && moverse:
					position.y += twoStep
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					$ErrorPolvo.visible = true
					$ErrorPolvo.play()
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("tilemapDerecha"):
				if global_position.x < 580 && moverse:
					position.x += twoStep
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					$ErrorPolvo.visible = true
					$ErrorPolvo.play()
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("tilemapIzquierda"):
				if global_position.x > 280 && moverse:
					position.x -= twoStep
					moverse = false
					pisada.play()
				else:
					error.play("Error")
					$ErrorPolvo.visible = true
					$ErrorPolvo.play()
					emit_signal("noTeMuevas")
			if Input.is_action_just_pressed("espacio"):
				pisoton.play()
				$Timer.start()
	
	

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


func _on_paso_animation_finished(anim_name: StringName) -> void:
	moverse = true
	$AnimatedSprite2D.visible = false
	$AnimatedSprite2D2.visible = false
	$AnimatedSprite2D3.visible = false
	$AnimatedSprite2D4.visible = false
	$Paso.play()


func _on_timer_timeout() -> void:
	$AnimatedSprite2D.visible = false
	$AnimatedSprite2D2.visible = false
	$AnimatedSprite2D3.visible = false
	$AnimatedSprite2D4.visible = false
	$AnimationPlayer.stop()

func _on_error_polvo_animation_finished() -> void:
	print("terminé")
	$ErrorPolvo.visible = false
