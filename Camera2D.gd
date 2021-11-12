extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Raath=get_parent().get_node("Raath/RaathSprite").get_node("lowerbody")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Game.gamestate==Game.state.PULL):
		self.position.x=Raath.global_position.x+1000
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
