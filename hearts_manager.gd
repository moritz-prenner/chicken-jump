extends TextureRect

var currentHearts = 3
@onready var oneHeartsTexture = preload("res://assets/1Hearts.png")
@onready var twoHeartsTexture = preload("res://assets/2Hearts.png")
@onready var threeHeartsTexture = preload("res://assets/3Hearts.png")

@onready var gameOverScreen = $"../Pause/GameOver"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gameOverScreen.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func damage():
	currentHearts -= 1
	if currentHearts == 0:
		gameOverScreen.visible = true
	else:
		match currentHearts:
			3:
				texture = threeHeartsTexture
			2:
				texture = twoHeartsTexture
			1:
				texture = oneHeartsTexture
