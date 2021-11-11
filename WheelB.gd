extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WheelB_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"):
			Game.raath_part_to_attach=self
