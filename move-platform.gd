extends Path2D

@export var loop = true
@export var speed = 0.8
@export var speed_scale = 1.0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var anim = $AnimatableBody2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("floating")
	if not loop:
		animation.play("move-platform1")
		animation.speed_scale = speed_scale
		set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animation.play("move-platform1")
	
