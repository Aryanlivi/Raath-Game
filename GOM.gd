extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var allow_update:bool=false
var Options_Scene=preload("res://Options.tscn")
var options=null
var options_enabled:bool=false
var options_offset=130
var power=null
var rope_attached:bool=false
var direction="Right"
var strength=null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_options():
	Game.currentGOM.options_enabled=true
	Game.currentGOM.options=Options_Scene.instance()
	add_child(Game.currentGOM.options)
	Game.currentGOM.options.position.x=self.position.x-options_offset
	Game.currentGOM.options.position.y=self.position.y-options_offset
	for ele in Game.GOMArray:
		if(ele!=Game.currentGOM):
			remove_options(ele)
		
func remove_options(ele):
	if(ele.options_enabled):
		ele.options.queue_free()
		ele.options_enabled=false
		
func update_options():
	allow_update=false
	if(!Game.currentGOM.options_enabled):
		Game.currentGOM.show_options()
	#var button=Game.currentGOM.options.get_node(Game.button_pressed.name)
	if(Game.currentGOM.direction=="Right" and Game.button_pressed):
		Game.currentGOM.scale.x=1
		Game.currentGOM.options.scale.x=2
		Game.currentGOM.position.x+=options_offset
		Game.currentGOM.options.position.x-=options_offset
		Game.button_pressed=false
		
	elif(Game.currentGOM.direction=="Left" and  Game.button_pressed):
		Game.currentGOM.scale.x=-1
		Game.currentGOM.options.scale.x=-2
		Game.currentGOM.position.x-=options_offset
		Game.currentGOM.options.position.x+=options_offset
		Game.button_pressed=false
	#self.options.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Game.gamestate==Game.state.OPTIONS and allow_update):
		update_options()
	if Game.gamestate==Game.state.PULL:
		self.input_pickable=true
		remove_options(self)
	if(Game.gamestate==Game.state.DRAG):
		var current_GOM=get_node(Game.gom_path)
		Game.currentPF=current_GOM.get_parent()
		for rope in Game.Ropes:
			if(rope.GOM==current_GOM):
				Game.Ropes.erase(rope)
				rope.queue_free()
		var mousepos=get_global_mouse_position()
		var direction=(mousepos-Game.currentPF.position).normalized()
		var speed=10
		Game.currentPF.offset+=direction.x*speed
	
		
	


func _on_GOM_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("click"): 
		Game.gom_path=self.get_path() 
		if Game.gamestate==Game.state.IDLE or Game.gamestate==Game.state.DRAG:
			Game.currentGOM=self
			Game.gamestate=Game.state.OPTIONS
			Game.ManPath.update_init_offset()
		if(Game.gamestate==Game.state.OPTIONS):
			Game.currentGOM=self
			allow_update=true
			#Game.gamestate=Game.state.CREATE
		if(Game.gamestate==Game.state.PULL):
			Game.gamestate=Game.state.DRAG
			#Game.IdleGroup+=1
		
				
		
