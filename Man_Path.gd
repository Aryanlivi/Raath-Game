extends Path2D
var t=0
var Pathfollow:Array=[]
var init_offset:Array=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,Game.GroupCount):
		var pf=self.get_node("PF"+str(i+1))
		Pathfollow.append(pf)
		init_offset.append(pf.offset)

func _process(delta):
	if(Game.gamestate==Game.state.PULL):
		t+=delta
		for i in range(0,Game.GroupCount):
			Pathfollow[i].offset=init_offset[i]+t*100
		if(Pathfollow[0].unit_offset==1):
			Game.gamestate=Game.state.END
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
