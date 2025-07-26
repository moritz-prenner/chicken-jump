extends Path2D

@onready var anim = $AnimatableBody2D/AnimatedSprite2D
@onready var player = $"../CharacterBody2D"
@onready var hearts = $"../UI/HeartsManager"
@onready var animationPlayer = $AnimationPlayer

var y_delta
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")
	animationPlayer.play("move-enemy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		y_delta = position.y - player.y
		if (y_delta > 30):
			player.jump()
			queue_free()
		else:
			hearts.damage()
