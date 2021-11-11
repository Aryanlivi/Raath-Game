extends Node2D 
var RopePiece=preload("res://RopePiece.tscn")
onready var raath=get_parent().get_node("Raathnew")
onready var RopeCursor=get_parent().get_node("RopeCursor")
onready var RopeCursorJ=RopeCursor.get_node("J")
var no_of_pieces=0
const offset=Vector2(0,0)
#const piece_size=16
var pieces=[]
var joint=null
var endpiece=null
var man_joint=[]
func spawn_rope(body:Array):
	var No_of_men=body.size()
	no_of_pieces+=30
	for i in range(0,no_of_pieces):
		if(i<No_of_men):
			##give node_a
			man_joint.append(body[i].get_node("J"))
			man_joint[i].node_a=body[i].get_path()
			joint=man_joint[i]
		init_rope_piece(joint)
		joint=pieces[i].get_node("J")
	for i in range(0,no_of_pieces):
		add_joint(i)
	attach_to_man(No_of_men)
	attach_rope(RopeCursor,RopeCursorJ)

func calculate_distance():
	#Calculate distance to find no of required pieces.
	#var distance=startpos.distance_to(endpos)
	#no_of_pieces=round(distance/piece_size)
	#return no_of_pieces
	pass
	
func attach_to_man(size:int):
	for i in range(0,size):
		man_joint[i].node_b=pieces[i].get_path()
		
func init_rope_piece(joint:PinJoint2D):
	var rope_piece=RopePiece.instance()
	rope_piece.global_position=joint.global_position+offset
	add_child(rope_piece)
	pieces.append(rope_piece);

func add_joint(index:int):
	var joint=pieces[index].get_node("J")
	joint.node_a=pieces[index].get_path()
	if(index+1!=no_of_pieces):
		joint.node_b=pieces[index+1].get_path()

func attach_rope(body:PhysicsBody2D,endjoint:PinJoint2D):
	endpiece=pieces[pieces.size()-1]
	endpiece.global_position=body.global_position-offset
	endjoint.node_a=body.get_path()
	endjoint.node_b=endpiece.get_path()
	
func attach_to_raath():
	var joint=endpiece.get_node("J")
	joint.node_b=Game.raath_part_to_attach.get_path()
	RopeCursorJ.node_b="../"
	
func _process(delta):
	var endpos=get_global_mouse_position()
	RopeCursor.global_position=lerp(RopeCursor.global_position,endpos,5*delta)
