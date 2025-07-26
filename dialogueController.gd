extends TextureRect

@onready var infoText = $infoText
@onready var player = $"../../CharacterBody2D"

var firstTime1 = true
var firstTime2 = true
var firstTime3 = true
var firstTime4 = true
var firstTime5 = true


var dialogCounter = 1

const firstMessage = """Welcome to this Game!
First I am going to walk you 
through the basic 
controls. After that I am going 
to show you the basic mechanics."""

const secondMessage = """Press the left and right arrow Keys to move around. You can dash by pressing Shift or A but the dash has a 4 second cooldown! 
Press Space or B to jump!"""

const thirdMessage = "Use the elevator on the right to get to the platform above!"

const fourthMessage = """Every Level you can obtain up to three stars. At the end of every Level there will be an overview on how many stars you collected."""

const fifthMessage = """On the top right of the screen you can see three Hearts. If you take damage you lose one Heart. For example saws give damage when touched. Now try to not touch those saws!"""

const sixthMessage = """There are also Enemies in this Game. To beat them you have to jump on their Head. But be careful to not touch dem on their sides!"""

const seventhMessage = """If you see a fan blowing air in one directon you can hop into the stream and travel from A to B in a few seconds."""

const eighthMessage = """At the end of every Level you will find a big trophy. To clear the level you have to collect it!"""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().paused = true
	visible = true
	while not Input.is_action_just_pressed("Accept"):
		await get_tree().process_frame
	infoText.text = secondMessage
	await get_tree().create_timer(0.5).timeout
	while not Input.is_action_just_pressed("Accept"):
		await get_tree().process_frame
	infoText.text = thirdMessage
	await get_tree().create_timer(0.5).timeout
	while not Input.is_action_just_pressed("Accept"):
		await get_tree().process_frame
	visible = false
	get_tree().paused = false
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_trigger_1_body_entered(body: Node2D) -> void:
	if body == player and firstTime1 == true:
		await wait_until_on_floor()
		visible = true
		get_tree().paused = true
		infoText.text = fourthMessage
		while not Input.is_action_just_pressed("Accept"):
			await get_tree().process_frame
		visible = false
		get_tree().paused = false
		firstTime1 = false


func _on_trigger_2_body_entered(body: Node2D) -> void:
	if body == player and firstTime2 == true:
		await wait_until_on_floor()
		visible = true
		get_tree().paused = true
		infoText.text = fifthMessage
		while not Input.is_action_just_pressed("Accept"):
			await get_tree().process_frame
		visible = false
		get_tree().paused = false
		firstTime2 = false


func _on_trigger_3_body_entered(body: Node2D) -> void:
	if body == player and firstTime3 == true:
		await wait_until_on_floor()
		visible = true
		get_tree().paused = true
		infoText.text = sixthMessage
		while not Input.is_action_just_pressed("Accept"):
			await get_tree().process_frame
		visible = false
		get_tree().paused = false
		firstTime3 = false


func _on_trigger_4_body_entered(body: Node2D) -> void:
	if body == player and firstTime4 == true:
		await wait_until_on_floor()
		visible = true
		get_tree().paused = true
		infoText.text = seventhMessage
		while not Input.is_action_just_pressed("Accept"):
			await get_tree().process_frame
		visible = false
		get_tree().paused = false
		firstTime4 = false


func _on_trigger_5_body_entered(body: Node2D) -> void:
	if body == player and firstTime5 == true:
		await wait_until_on_floor()
		visible = true
		get_tree().paused = true
		infoText.text = eighthMessage
		while not Input.is_action_just_pressed("Accept"):
			await get_tree().process_frame
		visible = false
		get_tree().paused = false
		firstTime5 = false

func wait_until_on_floor() -> void:
	while not player.is_on_floor():
		await get_tree().process_frame
