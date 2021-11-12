extends Node
enum state{IDLE,CREATE,ATTACH,PULL,STOP}
var level=1
var GroupCount:int
var IdleGroup:int
var gamestate=state.IDLE
var gom_path=null
var raath_part_to_attach=null
var currentRope=null
func _ready():
	print("Game Initialized!")
	if(level==1):
		GroupCount=4
		IdleGroup=4
