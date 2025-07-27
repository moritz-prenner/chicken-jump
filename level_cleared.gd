extends Panel

@onready var star = $"../../Stars/star"
@onready var textureRect = $TextureRect

@onready var star0 = preload("res://assets/star0.png")
@onready var star1 = preload("res://assets/star1.png")
@onready var star2 = preload("res://assets/star2.png")
@onready var star3 = preload("res://assets/star3.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func levelCleared():
	await get_tree().create_timer(1).timeout
	visible = true
	get_tree().paused = true
	match star.starCounter:
		0:
			textureRect.texture = star0
		1:
			textureRect.texture = star1
		2:
			textureRect.texture = star2
		3:
			textureRect.texture = star3
