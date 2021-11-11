extends Node2D

#No of men in each group
var ManCount:int=5
var ManArray:Array=[]
var NonIdleGroup:int=0
var Rope=preload("res://Rope.tscn")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if !event.pressed and Game.gamestate==Game.state.ATTACH and Game.raath_part_to_attach!=null :
				Game.currentRope.attach_to_raath()
				Game.raath_part_to_attach=null
				#updates number of unused groups. Activates PULL state as value soon as it becomes 0
				Game.IdleGroup-=1

func create_rope(group_name:String):
	#get path to the group that is emmiting event.
	var path=("Man_Path/PathFollow2D/"+group_name)
	#get path to the group
	var GOM=get_node(path)
	#create an array of man so that the first few rope pieces will stay connected to man.
	for idx in range(0,ManCount):
			var val=GOM.get_node("Man"+str(idx+1))
			ManArray.append(val)
	#new rope instance
	Game.currentRope=Rope.instance()
	add_child(Game.currentRope)
	Game.currentRope.spawn_rope(ManArray) 
	Game.gamestate=Game.state.ATTACH
	#disabling collision shape for the said group so that it can no longer emit events.
	var Collision=GOM.get_node("C")
	Collision.disabled=true
	#clear the array of man for the next call.
	ManArray.clear()
	
	
func _process(delta):
	if(Game.gamestate==Game.state.CREATE):
		create_rope(Game.gom_id)
	if(Game.IdleGroup==0):
		Game.gamestate=Game.state.PULL
