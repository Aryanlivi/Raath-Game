extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _pressed():
	if(Game.currentGOM.direction=="Left"):
		Game.currentGOM.direction="Right"
		Game.currentGOM.allow_update=true
		Game.button_pressed=true
	#Game.currentGOM.scale.x=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
