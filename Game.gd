extends Node
enum state{IDLE,CREATE,ATTACH,PULL}
var level=1
var IdleGroup:int
var gamestate=state.IDLE
var gom_id=null
var raath_part_to_attach=null
var currentRope=null
func _ready():
	print("Game Initialized!")
	if(level==1):
		IdleGroup=4
