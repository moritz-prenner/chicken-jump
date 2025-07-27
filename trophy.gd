extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var map = $"../TileMapLayer"
@onready var levelClearedController = $"../UI/LevelCleared"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	print("entered")
	if body != map:
		print("detectet")
		anim.play("triggered")
		levelClearedController.levelCleared()
