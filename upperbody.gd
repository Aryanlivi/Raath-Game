extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var C_Body=null
# Called when the node enters the scene tree for the first time.
func _process(delta):
	C_Body=get_colliding_bodies()
	if(C_Body.size()>1):
		Game.gamestate=Game.state.END
func _ready():
	pass # Replace with function body.

func _on_upperbody_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
		Game.raath_part_to_attach=self
		


