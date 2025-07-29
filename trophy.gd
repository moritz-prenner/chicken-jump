extends Area2D

@onready var anim = $AnimatedSprite2D
@onready var map = $"../TileMapLayer"
@onready var levelClearedController = $"../UI/LevelCleared"
@onready var clear_sfx = $clear_sfx

var firstTimeTrophy = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body != map and firstTimeTrophy == true:
		firstTimeTrophy = false
		anim.play("triggered")
		clear_sfx.play()
		await get_tree().create_timer(3.0).timeout
		levelClearedController.levelCleared()
		await get_tree().create_timer(1.0).timeout
		visible = false
		
