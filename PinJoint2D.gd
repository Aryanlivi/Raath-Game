extends PinJoint2D

onready var joint=get_parent().get_node("J")
onready var S2=get_parent()
onready var R5=get_parent().get_parent().get_node("R5")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	joint.node_a=S2.get_path()
	joint.node_b=R5.get_path()
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
