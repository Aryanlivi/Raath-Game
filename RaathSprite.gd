extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Game.gamestate!=Game.state.PULL):
		var val=true
		$Wheelsupport.sleeping=val
		$WheelA.sleeping=val
		$WheelB.sleeping=val
		$lowerbody.sleeping=val
		$upperbody.sleeping=val
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
