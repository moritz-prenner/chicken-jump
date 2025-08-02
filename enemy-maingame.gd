extends Path2D

@onready var anim = $AnimatableBody2D/AnimatedSprite2D
@onready var player = $"../CharacterBody2D"
@onready var hearts = $"../UI/HeartsManager"
@onready var animationPlayer = $AnimationPlayer

var y_delta

var active1 = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animationPlayer.play("move-enemy")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if active1 == true:
		if body == player:
			y_delta = position.y - player.position.y
			if (y_delta > 30):
				player.jump()
				deactivate()
			else:
				hearts.damage()

func deactivate():
	active1 = false
	visible = false
	set_process(false)
	set_physics_process(false)
	position.x += 100000000000000
	
func reactivate():
	active1 = true
	visible = false
	set_process(false)
	set_physics_process(false)
