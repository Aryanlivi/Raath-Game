extends Node2D
onready var sbody=get_node("S")
#onready var sbody2=get_node("S2");
#onready var sjoint2=sbody2.get_node("J")
var Rope=preload("res://Rope.tscn")
var startpos=Vector2.ZERO
var endpos=Vector2.ZERO
func _ready():
	Game.currentRope=Rope.instance()
	add_child(Game.currentRope)
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed and Game.gamestate==Game.state.rope_state :
				Game.gamestate=Game.state.rope_attach
				Game.currentRope.attach_to_raath()
				print("attached")
		""""
		if event.pressed:
				Game.gamestate=Game.state.rope_state
				startpos=sbody.global_position
				if(endpos==Vector2.ZERO):
					endpos=get_global_mouse_position()
				Game.currentRope.spawn(sbody,startpos,endpos);
				print("input")
			if !event.pressed:
				Game.gamestate=Game.state.rope_attach
				print("done")
		startpos=sbody.global_position
		endpos=get_global_mouse_position()
		var rope=Rope.instance()
		add_child(rope);
		rope.spawn(sbody,startpos,endpos);
		"""
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		startpos=sbody.global_position
		Game.gamestate=Game.state.rope_state
		endpos=get_global_mouse_position()
		Game.currentRope.spawn(sbody,startpos,endpos)
		
func _process(delta):
	if(Game.gamestate==Game.state.rope_state):
		pass
