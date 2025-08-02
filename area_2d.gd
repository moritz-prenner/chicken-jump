extends Area2D

@onready var hearts: TextureRect = $"../UI/HeartsManager"
@onready var tile_map: TileMap = $"../TileMap"
@onready var tile_map_layer: TileMapLayer = $"../TileMapLayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body != tile_map:
		if body != tile_map_layer:
			hearts.currentHearts = 1;
			hearts.damage()
