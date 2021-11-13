extends Node
enum state{IDLE,CREATE,PULL,DRAG,END}
var level=1
var GroupCount:int
var IdleGroup:int
var gamestate=state.IDLE
var allow_attach:bool=false
var allow_pull:bool=false
var allow_drag:bool=false
var gom_path=null
var raath_part_to_attach=null
var currentRope=null
var Ropes:Array
func _ready():
	print("Game Initialized!")
	if(level==1):
		Ropes=[]
		GroupCount=4
		IdleGroup=4 
func _process(delta):
	if(Game.IdleGroup==0 and Game.allow_pull==false):
		Game.allow_pull=true
func CREATE_STATE():
	allow_attach=true
	allow_pull=false
	allow_drag=false
	raath_part_to_attach=null
	
func PULL_STATE():
	allow_attach=false
	allow_pull=true
	allow_drag=false
	raath_part_to_attach=false
	currentRope=null
	
func DRAG_STATE():
	allow_attach=false
	allow_pull=false
	allow_drag=true
