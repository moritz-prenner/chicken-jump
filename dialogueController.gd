extends TextureRect

@onready var infoText = $infoText

const firstMessage = "Welcome to this Game!
First I am going to walk you 
through the basic 
controls. After that I am going 
to show you the basic mechanics."

const secondMessage = "Press the left and right arrow Keys to move around. Press Space or B to jump!"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
