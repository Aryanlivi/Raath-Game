extends Node2D
onready var sbody=get_node("S")
var Rope=preload("res://Rope.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if !event.pressed and Game.gamestate==Game.state.rope_state and Game.raath_part_to_attach!=null :
				Game.currentRope.attach_to_raath()
				Game.gamestate=Game.state.rope_attached
				Game.raath_part_to_attach=null
				
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		Game.currentRope=Rope.instance()
		add_child(Game.currentRope)
		Game.currentRope.spawn(sbody)
		Game.gamestate=Game.state.rope_state
		
func _on_Wheelsupport_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		var body=get_node("Raathnew/Wheelsupport")
		Game.raath_part_to_attach=body

func _on_lowerbody_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		var body=get_node("Raathnew/lowerbody")
		Game.raath_part_to_attach=body
		
func _on_upperbody_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		var body=get_node("Raathnew/upperbody")
		Game.raath_part_to_attach=body
