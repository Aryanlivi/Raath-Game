extends Path2D
var t=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	if(Game.gamestate==Game.state.pulling_raath):
		t+=delta
		$PathFollow2D.offset=t*100

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
