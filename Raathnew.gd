extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Game.gamestate!=Game.state.PULL):
		$Wheelsupport.sleeping=true
		$WheelA.sleeping=true
		$WheelB.sleeping=true
		$lowerbody.sleeping=true
		$upperbody.sleeping=true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
