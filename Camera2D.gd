extends Camera2D


# Declare member variables here. Examples:
onready var Raath=get_parent().get_node("Raath/RaathSprite").get_node("lowerbody")
var cam_offset=1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	self.position.x=Raath.global_position.x+cam_offset
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
