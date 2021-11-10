extends Node
enum state{idle,rope_state,rope_attached,pulling_raath}
var gamestate=state.idle
var raath_part_to_attach=null
var currentRope=null
func _ready():
	print("Game Initialized!")
