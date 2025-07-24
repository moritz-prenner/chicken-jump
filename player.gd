extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

@onready var anim = $AnimatedSprite2D
var facing_right := true

func _physics_process(delta: float) -> void:
	# Schwerkraft
	if not is_on_floor():
		velocity.y += get_gravity().y * delta


	# Springen
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Bewegung links/rechts
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED

		if direction > 0:
			facing_right = true
			anim.play("run-right")
		else:
			facing_right = false
			anim.play("run-left")
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

		if is_on_floor():
			if facing_right:
				anim.play("idle-right")
			else:
				anim.play("idle-left")

	move_and_slide()  # Kein velocity übergeben in Godot 4 – es nutzt self.velocity





func _on_area_2d_area_entered(area: Area2D) -> void:
	print("collided")
	if area.is_in_group("saw"):
		velocity.y = JUMP_VELOCITY
