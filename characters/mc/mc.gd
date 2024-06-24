extends CharacterBody2D

@export var move_speed : int = 16
@export var starting_direction: Vector2 = Vector2(0, 1)
@export var is_priest: bool = true

@onready var animation_tree = $AnimationTree
@onready var character_state = animation_tree.get("parameters/playback")
@onready var priest_state = animation_tree.get("parameters/Priest/playback")
@onready var plague_state = animation_tree.get("parameters/Plague/playback")


func _ready():
	update_animation_parameters(starting_direction)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	velocity = input_direction * move_speed

	move_and_slide()
	
	update_animation_parameters(input_direction)
	pick_new_state()


func update_animation_parameters(move_input : Vector2):
	if (move_input != Vector2.ZERO):
			animation_tree.set("parameters/Priest/Walk/blend_position", move_input)
			animation_tree.set("parameters/Priest/Idle/blend_position", move_input)
			animation_tree.set("parameters/Plague/Walk/blend_position", move_input)
			animation_tree.set("parameters/Plague/Idle/blend_position", move_input)

func pick_new_state():
	var state = ""
	if (velocity != Vector2.ZERO):
		state += "Walk"
	else:
		state += "Idle"
	if (is_priest):
		priest_state.travel(state)
	else:
		plague_state.travel(state)
	
func _input(event):
	if event.is_action_pressed("switch"):
		is_priest = !is_priest
		if (is_priest):
			character_state.travel("Priest")
		else:
			character_state.travel("Plague")
	if event.is_action_pressed("exit"):
			get_tree().quit()
		
