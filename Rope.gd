extends Node2D 
var RopePiece=preload("res://RopePiece.tscn")
onready var RopeCursor=get_parent().get_node("RopeCursor")
onready var RopeCursorJ=RopeCursor.get_node("J")
var no_of_pieces=0
var GOM=null
var No_of_men:int
#const piece_size=16
var pieces:Array=[]
var joint:PinJoint2D
var endpiece=null
var man_joint=[]
func spawn_rope(body:Array):
	self.No_of_men=body.size()
	self.no_of_pieces+=30
	for i in range(0,self.no_of_pieces):
		if(i<self.No_of_men):
			##give node_a
			self.man_joint.append(body[i].get_node("J"))
			self.man_joint[i].node_a=body[i].get_path()
			self.joint=self.man_joint[i]
		init_rope_piece(joint)
		self.joint=pieces[i].get_node("J")
	for i in range(0,self.no_of_pieces):
		add_joint(i)
	attach_to_man()
	attach_rope(self.RopeCursor,self.RopeCursorJ)

func calculate_distance():
	#Calculate distance to find no of required pieces.
	#var distance=startpos.distance_to(endpos)
	#no_of_pieces=round(distance/piece_size)
	#return no_of_pieces
	pass
	
func attach_to_man():
	for i in range(0,self.No_of_men):
		man_joint[i].node_b=pieces[i].get_path()
		
func init_rope_piece(joint:PinJoint2D):
	var rope_piece=RopePiece.instance()
	rope_piece.global_position=joint.global_position
	add_child(rope_piece)
	pieces.append(rope_piece);

func add_joint(index:int):
	self.joint=pieces[index].get_node("J")
	self.joint.node_a=pieces[index].get_path()
	if(index+1!=no_of_pieces):
		joint.node_b=pieces[index+1].get_path()

func attach_rope(body:PhysicsBody2D,endjoint:PinJoint2D):
	self.endpiece=pieces[pieces.size()-1]
	self.endpiece.global_position=body.global_position
	endjoint.node_a=body.get_path()
	endjoint.node_b=endpiece.get_path()
	
func attach_to_raath():
	self.joint=self.endpiece.get_node("J")
	self.joint.node_b=Game.raath_part_to_attach.get_path()
	self.RopeCursorJ.node_b="../"
	
func _process(delta):
	var endpos=get_global_mouse_position()
	RopeCursor.global_position=lerp(RopeCursor.global_position,endpos,5*delta)
