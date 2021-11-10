extends Node2D
onready var sbody=get_node("S")
onready var GOM=get_node("Path2D/PathFollow2D/GOM")
var No_of_men=5
var man=[]
var Rope=preload("res://Rope.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if !event.pressed and Game.gamestate==Game.state.rope_state and Game.raath_part_to_attach!=null :
				Game.currentRope.attach_to_raath()
				Game.gamestate=Game.state.rope_attached
				Game.raath_part_to_attach=null
	
		
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

"""
func _on_Man_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		Game.currentRope=Rope.instance()
		add_child(Game.currentRope)
		Game.currentRope.spawn(man)
		Game.gamestate=Game.state.rope_state

"""

func _on_GOM_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		for idx in range(1,No_of_men):
			var val=GOM.get_node("Man"+str(idx))
			man.append(val)
		Game.currentRope=Rope.instance()
		add_child(Game.currentRope)
		Game.currentRope.spawn(man)
		Game.gamestate=Game.state.rope_state
