extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var player = $"../CharacterBody2D"
@onready var hearts = $"../UI/HeartsManager"

var y_delta
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		y_delta = position.y - body.y
		if (y_delta > 30):
			pass
		else:
			hearts.damage()
