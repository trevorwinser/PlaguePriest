extends CharacterBody2D

@export var move_speed : int = 32
@export var starting_direction: Vector2 = Vector2(0, -0.1)
@export var is_priest : bool = true

#@onready var animation_tree = $AnimationTree
#@onready var state_machine = animation_tree.get("parameters/playback")

#func _ready():
	#update_animation_parameters(starting_direction)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	#update_animation_parameters(input_direction)
	
	velocity = input_direction.normalized() * move_speed
	
	move_and_slide()
	
	#pick_new_state()
	#
#
#func update_animation_parameters(move_input : Vector2):
	#if (move_input != Vector2.ZERO):
			#animation_tree.set("parameters/Walk_Priest/BlendSpace2D/blend_position", move_input)
			#animation_tree.set("parameters/Idle_Priest/BlendSpace2D/blend_position", move_input)
			#animation_tree.set("parameters/Walk_Plague/BlendSpace2D/blend_position", move_input)
			#animation_tree.set("parameters/Idle_Plague/BlendSpace2D/blend_position", move_input)
#
#func pick_new_state():
	#var state = ""
	#if (velocity != Vector2.ZERO):
		#state += "Walk_"
		#if (is_priest):
			#state += "Priest"
		#else:
			#state += "Plague"
	#else:
		#state += "Idle_"
		#if (is_priest):
			#state += "Priest"
		#else:
			#state += "Plague"
	#state_machine.travel(state)
		#
#func _input(event):
	#if event.is_action_pressed("switch"):
		#is_priest = !is_priest
