extends Node
enum state{idle,rope_state,rope_attach,new}
var gamestate=state.idle
var currentRope=null
func _ready():
	print("Game Initialized!")
