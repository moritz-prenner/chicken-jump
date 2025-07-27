extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -350.0
const HIT_VELOCITY = -500.0
const ELEVATE_VELOCITY = -200.0
const DASH_SPEED = 400.0
const DASH_TIME = 0.2
const HIT_ANIM_DURATION = 0.4
const DASH_COOLDOWN = 4.0  # Zeit in Sekunden, bevor Dash erneut erlaubt ist

var currentElevate = false
var is_dashing = false
var dash_timer = 0.0
var dash_cooldown_timer = 0.0
var hit_anim_timer = 0.0
var facing_right := true



@onready var anim = $Chicken

func _physics_process(delta: float) -> void:
	# Schwerkraft
	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	# Dash-Timer aktualisieren
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false
			velocity.x = 0

	# Cooldown-Timer
	if dash_cooldown_timer > 0.0:
		dash_cooldown_timer -= delta

	# Hit-Animation blockiert Eingabe
	if hit_anim_timer > 0.0:
		hit_anim_timer -= delta

	# Nur wenn kein Dash aktiv ist, normale Eingabe
	if not is_dashing:
		handle_movement_input()

	if currentElevate:
		velocity.y = ELEVATE_VELOCITY

	move_and_slide()

func handle_movement_input() -> void:
	# Während Hit-Animation keine Eingabe
	if hit_anim_timer > 0.0:
		return

	# Springen
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump()
		

	# Dash starten (nur am Boden und wenn kein Cooldown läuft)
	if Input.is_action_just_pressed("attack") and is_on_floor() and dash_cooldown_timer <= 0.0:
		start_dash()
		return

	var direction := Input.get_axis("left", "right")

	if direction != 0:
		velocity.x = direction * SPEED
		facing_right = direction > 0
		anim.play("run-right" if facing_right else "run-left")
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)
		if is_on_floor():
			anim.play("idle-right" if facing_right else "idle-left")

func start_dash():
	is_dashing = true
	dash_timer = DASH_TIME
	dash_cooldown_timer = DASH_COOLDOWN

	# Blickrichtungsabhängiger Dash
	velocity.x = DASH_SPEED if facing_right else -DASH_SPEED
	velocity.y = 0

	# Erst run, dann hit
	anim.play("run-right" if facing_right else "run-left")
	await get_tree().create_timer(0.1).timeout
	hit_anim_timer = HIT_ANIM_DURATION

func hit():
	velocity.y = HIT_VELOCITY
	velocity.x = -1500.0

func elevate():
	currentElevate = true

func elevateEnd():
	currentElevate = false

func jump():
	velocity.y = JUMP_VELOCITY
