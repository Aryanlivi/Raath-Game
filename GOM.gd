extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Game.gamestate==Game.state.PULL:
		self.input_pickable=true
			
	if(Game.gamestate==Game.state.DRAG):
		var current_GOM=get_node(Game.gom_path)
		Game.currenPF=current_GOM.get_parent()
		for rope in Game.Ropes:
			if(rope.GOM==current_GOM):
				Game.Ropes.erase(rope)
				rope.queue_free()
		var mousepos=get_global_mouse_position()
		var direction=(mousepos-Game.currenPF.position).normalized()
		var speed=10
		Game.currenPF.offset+=direction.x*speed
	
		
	


func _on_GOM_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"): 
		Game.gom_path=self.get_path()
		if Game.gamestate==Game.state.IDLE or Game.gamestate==Game.state.DRAG:
			Game.gamestate=Game.state.CREATE
		if(Game.gamestate==Game.state.PULL):
			Game.gamestate=Game.state.DRAG
				
		
